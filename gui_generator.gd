extends Node

const PROPERTY_TYPES := [ "TYPE_NIL", "TYPE_BOOL", "TYPE_INT", "TYPE_REAL",
	"TYPE_STRING", "TYPE_VECTOR2", "TYPE_RECT2", "TYPE_VECTOR3", "TYPE_TRANSFORM2D",
	"TYPE_PLANE", "TYPE_QUAT", "TYPE_AABB", "TYPE_BASIS", "TYPE_TRANSFORM",
	"TYPE_COLOR", "TYPE_NODE_PATH", "TYPE_RID", "TYPE_OBJECT", "TYPE_DICTIONARY",
	"TYPE_ARRAY", "TYPE_RAW_ARRAY", "TYPE_INT_ARRAY", "TYPE_REAL_ARRAY",
	"TYPE_STRING_ARRAY", "TYPE_VECTOR2_ARRAY", "TYPE_VECTOR3_ARRAY",
	"TYPE_COLOR_ARRAY", "TYPE_MAX", ]

export (String, FILE, "*.xml") var interface_file
export (String, FILE, "*.tscn") var save_file

# The XML parser object.
onready var xml_parser := XMLParser.new()

const PROPERTIES := {
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
	"EditorProperty": Properties.EDITOR_PROPERTY,
	"GraphNode": Properties.GRAPH_NODE,
	"GridContainer": Properties.GRID_CONTAINER,
	"MarginContainer": Properties.MARGIN_CONTAINER,
	"PanelContainer": Properties.PANEL_CONTAINER,
#	"ScriptEditor": Properties.SCRIPT_EDITOR,
	"ScrollContainer": Properties.SCROLL_CONTAINER,
#	"EditorInspector": Properties.EDITOR_INSPECTOR,
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
	"EditorFileDialog": Properties.EDITOR_FILE_DIALOG,
	"FileDialog": Properties.FILE_DIALOG,
	"ScriptCreateDialog": Properties.SCRIPT_CREATE_DIALOG,
	"Range": Properties.RANGE,
	"EditorSpinSlider": Properties.EDITOR_SPIN_SLIDER,
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

# The root GUI object.
onready var _gui

func _ready() -> void:
	# Prepare the scene.
	var gui = Control.new()
	gui.set_name("GUI")
	add_child(gui, true)

	_parse_xml()

	if save_file:
		var packed_scene := PackedScene.new()
		packed_scene.pack(_gui)
		ResourceSaver.save(save_file, packed_scene)

		get_tree().change_scene(save_file)

func _parse_xml() -> void:
	var current_node:Control = $GUI

	xml_parser.open(interface_file)

	while xml_parser.read() == OK:
		var xml_node_type := xml_parser.get_node_type()

		match xml_node_type:

			XMLParser.NODE_NONE:
				pass

			XMLParser.NODE_ELEMENT:
				var new_node:Control
				var xml_node_name := xml_parser.get_node_name().to_lower()

				match xml_node_name:
#					node
#					canvasitem
					"control": new_node = Control.new()
#					basebutton
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
#					boxcontainer
					"colorpicker": new_node = ColorPicker.new()
					"hboxcontainer", "hbox": new_node = HBoxContainer.new()
					"vboxcontainer", "vbox": new_node = VBoxContainer.new()
					"centercontainer", "center": new_node = CenterContainer.new()
#					"editorproperty": new_node = EditorProperty.new()
					"graphnode": new_node = GraphNode.new()
					"gridcontainer", "grid": new_node = GridContainer.new()
					"margincontainer", "margin": new_node = MarginContainer.new()
					"panelcontainer": new_node = PanelContainer.new()
					"scrollcontainer": new_node = ScrollContainer.new()
#					splitcontainer
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
#					"editorfiledialog", "editorfile": new_node = EditorFileDialog.new()
					"filedialog", "file": new_node = FileDialog.new()
#					"scriptcreatedialog": new_node = ScriptCreateDialog.new()
#					"editorspinslider": new_node = EditorSpinSlider.new()
#					range
					"progressbar", "progress": new_node = ProgressBar.new()
#					scrollbar
					"hscrollbar": new_node = HScrollBar.new()
					"vscrollbar": new_node = VScrollBar.new()
#					slider
					"hslider": new_node = HSlider.new()
					"vslider": new_node = VSlider.new()
					"spinbox": new_node = SpinBox.new()
					"textureprogress": new_node = TextureProgress.new()
					"referencerect": new_node = ReferenceRect.new()
					"richtextlabel", "richlabel": new_node = RichTextLabel.new()
#					separator
					"hseparator": new_node = HSeparator.new()
					"vseparator": new_node = VSeparator.new()
					"tabs": new_node = Tabs.new()
					"textedit": new_node = TextEdit.new()
					"texturerect", "texture": new_node = TextureRect.new()
					"tree": new_node = Tree.new()
					"videoplayer", "video": new_node = VideoPlayer.new()
					_: new_node = null

				if not new_node:
					var line := xml_parser.get_current_line()
					printerr("[%d] Unsupported node %s" % [line, xml_node_name])
					_quit()

				# Get the class of the node.  This is used for checking later.
				var node_class = new_node.get_class()
				# Set the node's default name to the name of the class.
				new_node.name = node_class

				# Override the name if there's a name attribute.
				if xml_parser.has_attribute("name"):
					new_node.name = xml_parser.get_named_attribute_value("name")

				# Add the node to the current (parent) node.
				current_node.add_child(new_node, true)

				# We need a root node for all child nodes to be owned by, but not $GUI.
				if not _gui:
					_gui = new_node

				new_node.owner = _gui

				# Get the list of exposed properties for the new node.
				var exposed_properties = {}
				var property_list = new_node.get_property_list()
				for property in property_list:
					if property.usage & PROPERTY_USAGE_STORAGE:
						exposed_properties[property.name] = property.type

				# Get the XML attributes for the XML node.
				for xml_attribute_index in xml_parser.get_attribute_count():
					var xml_attribute_name := xml_parser.get_attribute_name(xml_attribute_index)
					var xml_attribute_value := xml_parser.get_attribute_value(xml_attribute_index)

					# Compare the XML attribute with the exposed properties.
					if  exposed_properties.has(xml_attribute_name):
						# The property exists as-is.
						var property_name = xml_attribute_name
						var property_type = exposed_properties[property_name]
#						prints("OK", new_node.name, property_name, PROPERTY_TYPES[property_type])

						var property_value = _convert_property_value(xml_attribute_value, property_type)
						new_node.set(property_name, property_value)

					# Check to see if the node's class is in the custom properties list.
					if PROPERTIES.has(node_class):
						# Loop over every class to see if there are custom properties for the current class hierarchy.
						for current_node_class in PROPERTIES:
							if new_node.is_class(current_node_class):
								var node_properties:Dictionary = PROPERTIES[current_node_class]
								if node_properties.has(xml_attribute_name):
									var node_property:Dictionary = node_properties[xml_attribute_name]
									var node_property_name:String = node_property['property'] if node_property.has('property') else xml_attribute_name
									var node_property_type = node_property['type'] if node_property.has('type') else 'String'
									var node_property_literals:Dictionary = node_property['literals'] if node_property.has('literals') else {}
									var node_property_mask:Dictionary = node_property['mask'] if node_property.has('mask') else {}
									var node_property_calculated:bool = node_property['calculated'] if node_property.has('calculated') else false
									# Get the raw attribute value
									var attribute_value = xml_attribute_value

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

									var property_value = _convert_property_value(attribute_value, node_property_type)
									new_node.set(node_property_name, property_value)

									if node_property_calculated:
										call("_calculate_%s" % node_property_name, new_node, attribute_value)

					else:
						# The property is unknown, possibly aliased.
						prints("UNKNOWN", new_node.name, xml_attribute_name, xml_attribute_value)

				current_node = new_node

			XMLParser.NODE_ELEMENT_END:
				current_node = current_node.get_parent()

			XMLParser.NODE_TEXT:
				if current_node:
					var text := str(xml_parser.get_node_data())
					match current_node.get_class():
						"Button", "CheckBox", "CheckButton", "LinkButton", "Label":
							current_node.text = text
						_:
							var stripped := text.strip_edges()
							if stripped.length() > 0:
								var line := xml_parser.get_current_line()
								printerr("[%d] Unexpected text: %s" % [line, stripped])

			XMLParser.NODE_COMMENT:
				var line := xml_parser.get_current_line()
				var comment:String = xml_parser.get_node_name()
				print("[%d] Comment: %s" % [line, comment])

			XMLParser.NODE_CDATA:
				pass

			XMLParser.NODE_UNKNOWN:
				pass

const TYPE_MATERIAL := "Material"
const TYPE_TEXTURE := "Texture"
const TYPE_THEME := "Theme"
const TYPE_VIDEO_STREAM := "VideoStream"

func _convert_property_value(xml_value, property_type):
	var converted_value

	match property_type:
		TYPE_NIL: converted_value = null
		TYPE_BOOL: converted_value = bool(xml_value)
		TYPE_INT: converted_value = int(xml_value)
		TYPE_REAL: converted_value = float(xml_value)
		TYPE_STRING: converted_value = str(xml_value)
		TYPE_VECTOR2: converted_value = Convert.xml_attr_to_vector2(xml_value)
		TYPE_RECT2: converted_value = Convert.xml_attr_to_rect2(xml_value)
		#
		TYPE_OBJECT: pass # We handle objects separately below depending on their actual
						 # (named) type.
		#
		TYPE_STRING_ARRAY: converted_value = Convert.xml_attr_to_poolstringarray(xml_value)
		# Named object types
		TYPE_MATERIAL: converted_value = load(str(xml_value))
		TYPE_TEXTURE: converted_value = load(str(xml_value))
		TYPE_THEME: converted_value = load(str(xml_value))
		TYPE_VIDEO_STREAM: converted_value = load(str(xml_value))
		_:
			printerr("Don't know what to do with value!", xml_value, property_type)
			converted_value = str(xml_value)

	return converted_value

const ZERO := 0.0
const HALF := 0.5
const FULL := 1.0

func _calculate_layout(node:Control, xml_value):
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

func _quit():
	get_tree().quit()
