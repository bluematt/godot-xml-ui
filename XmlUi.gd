class_name ControlXml
extends Control

signal control_added(control_node)
signal completed(gui_node)

# The XML file to parse (required).
export (String, FILE, "*.xml") var ui_xml_file

# The root GUI object is the Control node that the script is attached to.
onready var _gui := self as Control

func _parse_xml() -> void:
	assert(ui_xml_file, "UI XML file required")

	printerr("WARNING: As of v3.2.2, Godot does not currently support line numbers in the XMLParser class.")
	printerr("         Therefore reported line numbers may be incorrect.")

	# The current node is set to the root node.
	var current_node:Node = _gui

	# Reference to the last good node
	var last_good_node = null
	# Reference to the last good node's line
	var last_good_line = null

	# The XML parser object.
	var parser := XMLParser.new()

	assert(OK == parser.open(ui_xml_file), "Could not open UI XML file: '%s'" % ui_xml_file)

	while parser.read() == OK:
		var line := parser.get_current_line()
		match parser.get_node_type():

			# If there's no node, do nothing.
			XMLParser.NODE_NONE:
				pass

			# If there's a node, parse it.
			XMLParser.NODE_ELEMENT:

				# Determine the node's tag.
				var tag := parser.get_node_name().to_lower()

				# Create a node based on the tag.
				var new_node := _create_node(tag)

				# If we don't know what the current tag is, report it and move
				# onto the next one.
				if not new_node:
					printerr("[Line %d] Warning: Ignoring unsupported tag <%s>" % [line, tag])
					continue

				# Get the class of the node.  This is used for capability
				# checking later.
				var node_class = new_node.get_class()

				# Set the node's default name to the name of the class.
				new_node.name = node_class

				# Override the name if there's a name attribute.
				if parser.has_attribute("scene:name"):
					new_node.name = parser.get_named_attribute_value("scene:name")

				# Add the node to the current (parent) node.
				current_node.add_child(new_node, true)

				# If we save this to an external file, all nodes need an owner.
				new_node.owner = _gui

				# Get the list of default exposed properties for the node's class.
				var exposed_properties = _get_exposed_properties(new_node)

				# Get the XML attributes for the XML node.
				for attr_index in parser.get_attribute_count():
					var attr_name := parser.get_attribute_name(attr_index)
					var attr_value := parser.get_attribute_value(attr_index)

					var attr_accepted := false
					var attr_handled := false

					# Compare the XML attribute with the exposed properties.
					# This handles the cases where the attribute is the same
					# name as the property, and the value is a simple value.
					if  exposed_properties.has(attr_name):
						attr_accepted = true
						var property_type = exposed_properties[attr_name]
						var property_value = Convert.xml_attr(attr_value, property_type)

						if property_value != null:
							new_node.set(attr_name, property_value)
							attr_handled = true

					# Check to see if the node's class is in the custom
					# properties list.  If so, this means it's either:
					# a) an aliased property, either for convenience or
					#    because there's no direct property name (it's in a
					#    subcategory);
					# b) the format requires special handling (e.g. it's not
					#    just a simple value.
					if Elements.ELEMENTS.has(node_class):

						# Loop over every class to see if there are custom properties for the current class hierarchy.
						for current_node_class in Elements.ELEMENTS:
							if new_node.is_class(current_node_class):
								var node_properties:Dictionary = Elements.ELEMENTS[current_node_class]
								if node_properties.has(attr_name):
									attr_accepted = true
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
									attr_handled = true

									if node_property_calculated:
										call("_calculate_%s" % node_property_name, new_node, attribute_value)
										attr_handled = true

					# We may not be able to handle an attribute.  If so, issue
					# a warning.
					if not attr_accepted:
						printerr("[Line %d] Warning: Unknown attribute '%s' in <%s %s=\"%s\"/>; ignored" % [line, attr_name, tag, attr_name, attr_value])
					else:
						if not attr_handled:
							printerr("[Line %d] Warning: Invalid attribute value '%s' in <%s %s=\"%s\"/>; ignored" % [line, attr_value, tag, attr_name, attr_value])

				# Self-closing elements do not have child nodes.
				if not parser.is_empty():
					current_node = new_node

				if new_node:
					emit_signal("control_added", new_node)

			# If the node is a closing tag, set the current node to the current
			# node's parent.  This lets us validate the structure of the XML.
			XMLParser.NODE_ELEMENT_END:
				last_good_node = current_node
				last_good_line = parser.get_current_line()
				current_node = current_node.get_parent()

			# Ingore text nodes.
			XMLParser.NODE_TEXT:
				pass

			# Print comments to the output console.
			XMLParser.NODE_COMMENT:
				var comment:String = parser.get_node_name()
				print("[Line %d] Comment: %s" % [line, comment])

			# Ignore CDATA.
			XMLParser.NODE_CDATA:
				pass

			# Print errors about unknown nodes.
			XMLParser.NODE_UNKNOWN:
				var unknown := parser.get_node_data()
				printerr("[Line %d] Unknown: %s" % [line, unknown])

	# After we've parsed everything, we should get back to a state where the
	# current node is the $GUI node.  If it's not, something went wrong with
	# the structure of the XML.
	assert(current_node == _gui, 'XML is invalid (Last %s at %d)' % [last_good_node, last_good_line])
#	if current_node != _gui:
#		printerr("XML structure is incorrect.")
#		return

	emit_signal("completed", self)

const ZERO := Control.ANCHOR_BEGIN
const FULL := Control.ANCHOR_END
const HALF := FULL * 0.5

const ANCHORS := {
		"topleft":     [ZERO, ZERO, ZERO, ZERO],
		"topright":    [FULL, ZERO, FULL, ZERO],
		"bottomright": [FULL, FULL, FULL, FULL],
		"bottomleft":  [ZERO, FULL, ZERO, FULL],

		"centerleft":   [ZERO, HALF, ZERO, HALF],
		"centertop":    [HALF, ZERO, HALF, ZERO],
		"centerright":  [FULL, HALF, FULL, HALF],
		"centerbottom": [HALF, FULL, HALF, FULL],
		"center":       [HALF, HALF, HALF, HALF],

		"leftwide":    [ZERO, ZERO, ZERO, FULL],
		"topwide":     [ZERO, ZERO, FULL, ZERO],
		"rightwide":   [FULL, ZERO, FULL, FULL],
		"bottomwide":  [ZERO, FULL, FULL, FULL],
		"vcenterwide": [HALF, ZERO, HALF, FULL],
		"hcenterwide": [ZERO, HALF, FULL, HALF],

		"fullrect": [ZERO, ZERO, FULL, FULL],
}

# Calculate the anchors for a node based on a layout.
# If the anchor is not recognised, keep the current anchors as-is.
# The node seems to be passed by reference.
func _calculate_layout(node:Control, xml_value:String) -> void:
	var anchors := [node.anchor_left, node.anchor_top, node.anchor_right, node.anchor_bottom]

	if ANCHORS.has(xml_value):
		anchors = ANCHORS[xml_value]

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

# Generate the UI on demand.
func generate_ui():
	_parse_xml()

# Saves the resulting Control node and its dependents as a new scene.
func save_scene(save_path:String):
	assert(save_path, "GUI scene requires a save path")

	var packed_scene := PackedScene.new()
	assert (OK == packed_scene.pack(_gui), "Cannot pack GUI scene")

	assert (OK == ResourceSaver.save(save_path, packed_scene), "Cannot save GUI scene to %s" % save_path)

class Elements:
	const ELEMENTS := {
		"Node": Properties.NODE,
		"CanvasItem": Properties.CANVAS_ITEM,
		"Control": Properties.CONTROL,
		"BaseButton": Properties.BASE_BUTTON,
		"Button": Properties.BUTTON,
		"CheckBox": Properties.CHECK_BOX,
		"CheckButton": Properties.CHECK_BUTTON,
		"ColorPickerButton": Properties.COLOR_PICKER_BUTTON,
		"MenuButton": Properties.MENU_BUTTON,
		"OptionButton": Properties.OPTION_BUTTON,
		"ToolButton": Properties.TOOL_BUTTON,
		"LinkButton": Properties.LINK_BUTTON,
		"TextureButton": Properties.TEXTURE_BUTTON,
		"ColorRect": Properties.COLOR_RECT,
		"Container": Properties.CONTAINER,
		"BoxContainer": Properties.BOX_CONTAINER,
		"ColorPicker": Properties.COLOR_PICKER,
		"HBoxContainer": Properties.HBOX_CONTAINER,
		"VBoxContainer": Properties.VBOX_CONTAINER,
		"CenterContainer": Properties.CENTER_CONTAINER,
		"GraphNode": Properties.GRAPH_NODE,
		"GridContainer": Properties.GRID_CONTAINER,
		"MarginContainer": Properties.MARGIN_CONTAINER,
		"PanelContainer": Properties.PANEL_CONTAINER,
		"ScrollContainer": Properties.SCROLL_CONTAINER,
		"SplitContainer": Properties.SPLIT_CONTAINER,
		"HSplitContainer": Properties.HSPLIT_CONTAINER,
		"VSplitContainer": Properties.VSPLIT_CONTAINER,
		"TabContainer": Properties.TAB_CONTAINER,
		"ViewportContainer": Properties.VIEWPORT_CONTAINER,
		"GraphEdit": Properties.GRAPH_EDIT,
		"ItemList": Properties.ITEM_LIST,
		"Label": Properties.LABEL,
		"LineEdit": Properties.LINE_EDIT,
		"NinePatchRect": Properties.NINE_PATCH_RECT,
		"Panel": Properties.PANEL,
		"Popup": Properties.POPUP,
		"PopupDialog": Properties.POPUP_DIALOG,
		"PopupMenu": Properties.POPUP_MENU,
		"PopupPanel": Properties.POPUP_PANEL,
		"WindowDialog": Properties.WINDOW_DIALOG,
		"AcceptDialog": Properties.ACCEPT_DIALOG,
		"ConfirmationDialog": Properties.CONFIRMATION_DIALOG,
		"FileDialog": Properties.FILE_DIALOG,
		"Range": Properties.RANGE,
		"ProgressBar": Properties.PROGRESS_BAR,
		"ScrollBar": Properties.SCROLL_BAR,
		"HScrollBar": Properties.HSCROLL_BAR,
		"VScrollBar": Properties.VSCROLL_BAR,
		"Slider" : Properties.SLIDER,
		"HSlider": Properties.HSLIDER,
		"VSlider": Properties.VSLIDER,
		"SpinBox": Properties.SPIN_BOX,
		"TextureProgress": Properties.TEXTURE_PROGRESS,
		"ReferenceRect": Properties.REFERENCE_RECT,
		"RichTextLabel": Properties.RICH_TEXT_LABEL,
		"Separator": Properties.SEPARATOR,
		"HSeparator": Properties.HSEPARATOR,
		"VSeparator": Properties.VSEPARATOR,
		"Tabs": Properties.TABS,
		"TextEdit": Properties.TEXT_EDIT,
		"TextureRect": Properties.TEXTURE_RECT,
		"Tree": Properties.TREE,
		"VideoPlayer": Properties.VIDEO_PLAYER,
	}

