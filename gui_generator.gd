extends Node

#const PROPERTY_TYPES := [ "TYPE_NIL", "TYPE_BOOL", "TYPE_INT", "TYPE_REAL",
#	"TYPE_STRING", "TYPE_VECTOR2", "TYPE_RECT2", "TYPE_VECTOR3", "TYPE_TRANSFORM2D",
#	"TYPE_PLANE", "TYPE_QUAT", "TYPE_AABB", "TYPE_BASIS", "TYPE_TRANSFORM",
#	"TYPE_COLOR", "TYPE_NODE_PATH", "TYPE_RID", "TYPE_OBJECT", "TYPE_DICTIONARY",
#	"TYPE_ARRAY", "TYPE_RAW_ARRAY", "TYPE_INT_ARRAY", "TYPE_REAL_ARRAY",
#	"TYPE_STRING_ARRAY", "TYPE_VECTOR2_ARRAY", "TYPE_VECTOR3_ARRAY",
#	"TYPE_COLOR_ARRAY", "TYPE_MAX", ]

# The XML file to parse (required).
export (String, FILE, "*.xml") var interface_file
# The Scene file to produce (optional).
export (String, FILE, "*.tscn") var save_file

# The XML parser object.
onready var _parser := XMLParser.new()

# The root GUI object.
onready var _gui

func _ready() -> void:
	if not interface_file:
		printerr("No interface_file")
		return

	# Prepare the scene.
	var gui = Control.new()
	gui.set_name("GUI")
	add_child(gui, true)

	_parse_xml()

	if save_file:
		var packed_scene := PackedScene.new()
		if OK != packed_scene.pack(_gui):
			printerr("Can not pack scene")
			return

		if OK != ResourceSaver.save(save_file, packed_scene):
			printerr("Can not save scene to %s" % save_file)
			return

		if OK != get_tree().change_scene(save_file):
			printerr("Can not preview scene %s" % save_file)
			return

func _parse_xml() -> void:
	printerr("WARNING: As of V3.2.2, Godot does not currently support line numbers in the XMLParser class.")
	printerr("         Therefore line numbers for any errors may be incorrect.")
	var current_node:Node = $GUI

	if OK != _parser.open(interface_file):
		printerr("Could not open XML file %s" % interface_file)
		return

	while _parser.read() == OK:
		var xml_node_type := _parser.get_node_type()

		match xml_node_type:

			# If there's no node, do nothing.
			XMLParser.NODE_NONE:
				pass

			# If there's a node, parse it.
			XMLParser.NODE_ELEMENT:

				# Determine the node's tag.
				var tag := _parser.get_node_name().to_lower()

				# Create a node based on the tag.
				var new_node := _create_node(tag)

				# If we don't know what the current tag is, report it and move
				# onto the next one.
				if not new_node:
					var line := _parser.get_current_line()
					printerr("[Line %d] Unsupported tag <%s>" % [line, tag])
					continue

				# Get the class of the node.  This is used for capability
				# checking later.
				var node_class = new_node.get_class()

				# Set the node's default name to the name of the class.
				new_node.name = node_class

				# Override the name if there's a name attribute.
				if _parser.has_attribute("name"):
					new_node.name = _parser.get_named_attribute_value("name")

				# Add the node to the current (parent) node.
				current_node.add_child(new_node, true)

				# We need a root node for all child nodes to be owned by, but not $GUI.
				if not _gui:
					_gui = new_node

				if new_node != _gui:
					new_node.owner = _gui

				# Get the list of default exposed properties for the node's class.
				var exposed_properties = _get_exposed_properties(new_node)

				# Get the XML attributes for the XML node.
				for attr_index in _parser.get_attribute_count():
					var attr_name := _parser.get_attribute_name(attr_index)
					var attr_value := _parser.get_attribute_value(attr_index)

					# Compare the XML attribute with the exposed properties.
					if  exposed_properties.has(attr_name):
						var property_name = attr_name
						var property_type = exposed_properties[attr_name]
						var property_value = Convert.xml_attr(attr_value, property_type)

						if property_value == null:
							var line := _parser.get_current_line()
							printerr("[Line %d] Could not parse attribute <%s %s=\"%s\"/>" % [line, tag, attr_name, attr_value])
						else:
							new_node.set(property_name, property_value)
					else:
						var line := _parser.get_current_line()
						printerr("[Line %d] Unexpected attribute <%s %s=\"%s\"/>" % [line, tag, attr_name, attr_value])

					# Check to see if the node's class is in the custom properties list.
					if Elements.ELEMENTS.has(node_class):
						# Loop over every class to see if there are custom properties for the current class hierarchy.
						for current_node_class in Elements.ELEMENTS:
							if new_node.is_class(current_node_class):
								var node_properties:Dictionary = Elements.ELEMENTS[current_node_class]
								if node_properties.has(attr_name):
									var node_property:Dictionary = node_properties[attr_name]
									var node_property_name:String = node_property['property'] if node_property.has('property') else attr_name
									var node_property_type = node_property['type'] if node_property.has('type') else 'String'
									var node_property_literals:Dictionary = node_property['literals'] if node_property.has('literals') else {}
									var node_property_mask:Dictionary = node_property['mask'] if node_property.has('mask') else {}
									var node_property_calculated:bool = node_property['calculated'] if node_property.has('calculated') else false
									# Get the raw attribute value
									var attribute_value = attr_value

									# If the value is a literal lookup, get it.
									if node_property_literals.size() > 0:
										if node_property_literals.has(attribute_value):
											attribute_value = node_property_literals[attribute_value]

									# If the value is a mask, get the total masked value.
									if node_property_mask.size() > 0:
										var mask_values = attribute_value.split(" ", false)
										attribute_value = 0
										for mask in mask_values:
											if node_property_mask.has(mask):
												attribute_value += node_property_mask[mask]

									var property_value = Convert.xml_attr(attribute_value, node_property_type)
									new_node.set(node_property_name, property_value)

									if node_property_calculated:
										call("_calculate_%s" % node_property_name, new_node, attribute_value)

					else:
						# The property is unknown, possibly aliased.
						prints("UNKNOWN", new_node.name, attr_name, attr_value)

				# Self-closing elements do not have child nodes.
				if not _parser.is_empty():
					current_node = new_node

			# If the node is a closing tag, set the current node to the current
			# node's parent.  This lets us validate the structure of the XML.
			XMLParser.NODE_ELEMENT_END:
				current_node = current_node.get_parent()

			# Ingore text nodes.
			XMLParser.NODE_TEXT:
				pass

			# Print comments to the console.
			XMLParser.NODE_COMMENT:
				var line := _parser.get_current_line()
				var comment:String = _parser.get_node_name()
				print("[Line %d] Comment: %s" % [line, comment])

			# Ignore CDATA.
			XMLParser.NODE_CDATA:
				pass

			XMLParser.NODE_UNKNOWN:
				var line := _parser.get_current_line()
				var unknown := _parser.get_node_data()
				printerr("[Line %d] Unknown: %s" % [line, unknown])

	# After we've parsed everything, we should get back to a state where the
	# current node is the $GUI node.  If it's not, something went wrong with
	# the structure of the XML.
	if current_node != $GUI:
		printerr("XML structure is incorrect.")
		return

const ZERO := Control.ANCHOR_BEGIN
const FULL := Control.ANCHOR_END
const HALF := FULL * 0.5

# Calculate the anchors for a node based on a layout.
# The node seems to be passed by reference.
func _calculate_layout(node:Control, xml_value:String) -> void:
	var anchors := [node.anchor_left, node.anchor_top, node.anchor_right, node.anchor_bottom]

	match str(xml_value):
		"topleft":     anchors = [ZERO, ZERO, ZERO, ZERO]
		"topright":    anchors = [FULL, ZERO, FULL, ZERO]
		"bottomright": anchors = [FULL, FULL, FULL, FULL]
		"bottomleft":  anchors = [ZERO, FULL, ZERO, FULL]

		"centerleft":   anchors = [ZERO, HALF, ZERO, HALF]
		"centertop":    anchors = [HALF, ZERO, HALF, ZERO]
		"centerright":  anchors = [FULL, HALF, FULL, HALF]
		"centerbottom": anchors = [HALF, FULL, HALF, FULL]
		"center":       anchors = [HALF, HALF, HALF, HALF]

		"leftwide":    anchors = [ZERO, ZERO, ZERO, FULL]
		"topwide":     anchors = [ZERO, ZERO, FULL, ZERO]
		"rightwide":   anchors = [FULL, ZERO, FULL, FULL]
		"bottomwide":  anchors = [ZERO, FULL, FULL, FULL]
		"vcenterwide": anchors = [HALF, ZERO, HALF, FULL]
		"hcenterwide": anchors = [ZERO, HALF, FULL, HALF]

		"fullrect": anchors = [ZERO, ZERO, FULL, FULL]
		_: pass

	node.anchor_left = anchors[0]
	node.anchor_top = anchors[1]
	node.anchor_right = anchors[2]
	node.anchor_bottom = anchors[3]

# Return a new node based on the XML element (tag).
func _create_node(xml_element:String) -> Control:
	var new_node:Control

	match xml_element:
		"control": new_node = Control.new()
		"button": new_node = Button.new()
		"checkbox": new_node = CheckBox.new()
		"checkbutton": new_node = CheckButton.new()
		"colorpickerbutton": new_node = ColorPickerButton.new()
		"menubutton": new_node = MenuButton.new()
		"optionbutton": new_node = OptionButton.new()
		"toolbutton": new_node = ToolButton.new()
		"linkbutton": new_node = LinkButton.new()
		"texturebutton": new_node = TextureButton.new()
		"colorrect": new_node = ColorRect.new()
		"container": new_node = Container.new()
		"colorpicker": new_node = ColorPicker.new()
		"hboxcontainer", "hbox": new_node = HBoxContainer.new()
		"vboxcontainer", "vbox": new_node = VBoxContainer.new()
		"centercontainer", "center": new_node = CenterContainer.new()
		"graphnode": new_node = GraphNode.new()
		"gridcontainer", "grid": new_node = GridContainer.new()
		"margincontainer", "margin": new_node = MarginContainer.new()
		"panelcontainer": new_node = PanelContainer.new()
		"scrollcontainer": new_node = ScrollContainer.new()
		"hsplitcontainer", "hsplit": new_node = HSplitContainer.new()
		"vsplitcontainer", "vsplit": new_node = VSplitContainer.new()
		"tabcontainer": new_node = TabContainer.new()
		"viewportcontainer", "viewport": new_node = ViewportContainer.new()
		"graphedit": new_node = GraphEdit.new()
		"itemlist", "list": new_node = ItemList.new()
		"label": new_node = Label.new()
		"lineedit", "input": new_node = LineEdit.new()
		"ninepatchrect", "ninepatch", "patchrect": new_node = NinePatchRect.new()
		"panel": new_node = Panel.new()
		"popup": new_node = Popup.new()
		"popupdialog", "dialog": new_node = PopupDialog.new()
		"popupmenu", "menu": new_node = PopupMenu.new()
		"popuppanel": new_node = PopupPanel.new()
		"windowdialog", "window": new_node = WindowDialog.new()
		"acceptdialog", "accept": new_node = AcceptDialog.new()
		"confirmationdialog", "confirmation": new_node = ConfirmationDialog.new()
		"filedialog", "file": new_node = FileDialog.new()
		"progressbar", "progress": new_node = ProgressBar.new()
		"hscrollbar": new_node = HScrollBar.new()
		"vscrollbar": new_node = VScrollBar.new()
		"hslider": new_node = HSlider.new()
		"vslider": new_node = VSlider.new()
		"spinbox": new_node = SpinBox.new()
		"textureprogress": new_node = TextureProgress.new()
		"referencerect": new_node = ReferenceRect.new()
		"richtextlabel", "richlabel": new_node = RichTextLabel.new()
		"hseparator": new_node = HSeparator.new()
		"vseparator": new_node = VSeparator.new()
		"tabs": new_node = Tabs.new()
		"textedit": new_node = TextEdit.new()
		"texturerect", "texture": new_node = TextureRect.new()
		"tree": new_node = Tree.new()
		"videoplayer", "video": new_node = VideoPlayer.new()
		"gui": new_node = Control.new()
		_: new_node = null

	return new_node

# Return the list of properties that can be saved to a scene from a particular node.
# The list is a Dictionary of {property: type}.
func _get_exposed_properties(node:Node) -> Dictionary:
	var exposed_properties := {}
	var property_list = node.get_property_list()

	for property in property_list:
		if property.usage & PROPERTY_USAGE_STORAGE:
			exposed_properties[property.name] = property.type

	return exposed_properties
