extends Node

const PROPERTY_TYPES := [ "TYPE_NIL", "TYPE_BOOL", "TYPE_INT", "TYPE_REAL",
	"TYPE_STRING", "TYPE_VECTOR2", "TYPE_RECT2", "TYPE_VECTOR3", "TYPE_TRANSFORM2D",
	"TYPE_PLANE", "TYPE_QUAT", "TYPE_AABB", "TYPE_BASIS", "TYPE_TRANSFORM",
	"TYPE_COLOR", "TYPE_NODE_PATH", "TYPE_RID", "TYPE_OBJECT", "TYPE_DICTIONARY",
	"TYPE_ARRAY", "TYPE_RAW_ARRAY", "TYPE_INT_ARRAY", "TYPE_REAL_ARRAY",
	"TYPE_STRING_ARRAY", "TYPE_VECTOR2_ARRAY", "TYPE_VECTOR3_ARRAY",
	"TYPE_COLOR_ARRAY", "TYPE_MAX", ]

const PROPERTY_NODE := {
	"name": { "type": TYPE_STRING },
	"pause_mode": { "type": TYPE_INT, "literals": {
		"inherit": Node.PAUSE_MODE_INHERIT,
		"stop": Node.PAUSE_MODE_STOP,
		"process": Node.PAUSE_MODE_PROCESS,
	}},
}

const PROPERTY_CANVAS_ITEM := {
	"material": { "type": "Material" },
}

const PROPERTY_CONTROL := {
	"focus_mode": { "type": TYPE_INT, "literals": {
		"none": Control.FOCUS_NONE,
		"click": Control.FOCUS_CLICK,
		"all": Control.FOCUS_ALL,
	}},
	"focus_neighbour_bottom": { "type": "NodePath" },
	"focus_neighbour_left": { "type": "NodePath" },
	"focus_neighbour_right": { "type": "NodePath" },
	"focus_neighbour_top": { "type": "NodePath" },
	"focus_next": { "type": "NodePath" },
	"focus_previous": { "type": "NodePath" },
	"grow_horizontal": { "type": TYPE_INT, "literals": {
		"begin": Control.GROW_DIRECTION_BEGIN,
		"end": Control.GROW_DIRECTION_END,
		"both": Control.GROW_DIRECTION_BOTH,
	}},
	"grow_vertical": { "type": TYPE_INT, "literals": {
		"begin": Control.GROW_DIRECTION_BEGIN,
		"end": Control.GROW_DIRECTION_END,
		"both": Control.GROW_DIRECTION_BOTH,
	}},
	"mouse_default_cursor_shape": { "type": TYPE_INT, "literals": {
		"arrow": Control.CURSOR_ARROW,
			"default": Control.CURSOR_ARROW,
			"pointer": Control.CURSOR_ARROW,
		"ibeam": Control.CURSOR_IBEAM,
			"text": Control.CURSOR_IBEAM,
			"input": Control.CURSOR_IBEAM,
		"pointing_hand": Control.CURSOR_POINTING_HAND,
			"hand": Control.CURSOR_POINTING_HAND,
		"cross": Control.CURSOR_CROSS,
		"wait": Control.CURSOR_WAIT,
		"busy": Control.CURSOR_BUSY,
		"drag": Control.CURSOR_DRAG,
		"can_drop": Control.CURSOR_CAN_DROP,
			"drop": Control.CURSOR_CAN_DROP,
		"forbidden": Control.CURSOR_FORBIDDEN,
		"vsize": Control.CURSOR_VSIZE,
			"v-size": Control.CURSOR_VSIZE,
		"hsize": Control.CURSOR_HSIZE,
			"h-size": Control.CURSOR_HSIZE,
		"bdiagsize": Control.CURSOR_BDIAGSIZE,
			"bltr-size": Control.CURSOR_BDIAGSIZE,
		"fdiagsize": Control.CURSOR_FDIAGSIZE,
			"tlbr-size": Control.CURSOR_FDIAGSIZE,
		"move": Control.CURSOR_MOVE,
		"vsplit": Control.CURSOR_VSPLIT,
			"v-split": Control.CURSOR_VSPLIT,
		"hsplit": Control.CURSOR_HSPLIT,
			"h-split": Control.CURSOR_HSPLIT,
		"help": Control.CURSOR_HELP,
	}},
	"mouse_filter": { "type": TYPE_INT, "literals": {
		"stop": Control.MOUSE_FILTER_STOP,
		"pass": Control.MOUSE_FILTER_PASS,
		"ignore": Control.MOUSE_FILTER_IGNORE,
	}},
	"size_flags_horizontal": { "type": TYPE_INT, "mask": {
		"fill": Control.SIZE_FILL,
		"expand": Control.SIZE_EXPAND,
		"shrink_center": Control.SIZE_SHRINK_CENTER,
		"shrink_end": Control.SIZE_SHRINK_END,
	}},
	"size_flags_vertical": { "type": TYPE_INT, "mask": {
		"fill": Control.SIZE_FILL,
		"expand": Control.SIZE_EXPAND,
		"shrink_center": Control.SIZE_SHRINK_CENTER,
		"shrink_end": Control.SIZE_SHRINK_END,
	}},
	"theme": { "type": "Theme" },
	"layout": { "calculated": true },
}

const PROPERTY_BASE_BUTTON := {
	"action_mode": { "type": TYPE_INT, "literals": {
		"press": BaseButton.ACTION_MODE_BUTTON_PRESS,
		"release": BaseButton.ACTION_MODE_BUTTON_RELEASE,
	}},
	"button_mask": { "type": TYPE_INT, "mask": {
		"left": BUTTON_MASK_LEFT,
		"middle": BUTTON_MASK_MIDDLE,
		"right": BUTTON_MASK_RIGHT,
	}},
	"enabled_focus_mode": { "type": TYPE_INT, "literals": {
		"none": Control.FOCUS_NONE,
		"click": Control.FOCUS_CLICK,
		"all": Control.FOCUS_ALL,
	}},
	"group": { "type": "ButtonGroup" },
	"shortcut": { "type": "ShortCut" },
}

const PROPERTY_BUTTON := {
	"align": { "type": TYPE_INT, "literals": {
		"left": Button.ALIGN_LEFT,
		"center": Button.ALIGN_CENTER,
		"right": Button.ALIGN_RIGHT,
	}},
	"icon": { "type": "Texture" },
}

const PROPERTY_CHECK_BOX := {}

const PROPERTY_CHECK_BUTTON := {}

const PROPERTY_COLOR_PICKER_BUTTON := {}

const PROPERTY_MENU_BUTTON := {}

const PROPERTY_OPTION_BUTTON := {}

const PROPERTY_TOOL_BUTTON := {}

const PROPERTY_LINK_BUTTON := {
	"underline": { "type": TYPE_INT, "literals": {
		"always": LinkButton.UNDERLINE_MODE_ALWAYS,
		"hover": LinkButton.UNDERLINE_MODE_ON_HOVER,
		"on_hover": LinkButton.UNDERLINE_MODE_ON_HOVER,
		"never": LinkButton.UNDERLINE_MODE_NEVER,
	}}
}

const PROPERTY_TEXTURE_BUTTON := {
	"stretch_mode": { "type": TYPE_INT, "literals": {
		"scale": TextureButton.STRETCH_SCALE,
		"tile": TextureButton.STRETCH_TILE,
		"keep": TextureButton.STRETCH_KEEP,
		"keep_centered": TextureButton.STRETCH_KEEP_CENTERED,
		"keep_aspect": TextureButton.STRETCH_KEEP_ASPECT,
		"keep_aspect_centered": TextureButton.STRETCH_KEEP_ASPECT_CENTERED,
		"keep_aspect_covered": TextureButton.STRETCH_KEEP_ASPECT_COVERED,
	}},
	"texture_click_mask": { "type": "BitMap" },
	"texture_disabled	": { "type": "Texture" },
	"texture_focused": { "type": "Texture" },
	"texture_hover": { "type": "Texture" },
	"texture_normal": { "type": "Texture" },
	"texture_pressed": { "type": "Texture" },
}

const PROPERTY_COLOR_RECT := {}

const PROPERTY_CONTAINER := {}

const PROPERTY_BOX_CONTAINER := {
	"alignment": { "type": TYPE_INT, "literals": {
		"begin": BoxContainer.ALIGN_BEGIN,
		"center": BoxContainer.ALIGN_CENTER,
		"end": BoxContainer.ALIGN_END,
	}},
}

const PROPERTY_COLOR_PICKER := {}

const PROPERTY_HBOX_CONTAINER := {
	"separation": { "property": "custom_constants/separation", "type": TYPE_INT, },
}

const PROPERTY_VBOX_CONTAINER := {
	"separation": { "property": "custom_constants/separation", "type": TYPE_INT, },
}

const PROPERTY_CENTER_CONTAINER := {}

const PROPERTY_EDITOR_PROPERTY := {}

const PROPERTY_GRAPH_NODE := {
	"overlay": { "type": TYPE_INT, "literals": {
		"disabled": GraphNode.OVERLAY_DISABLED,
		"breakpoint": GraphNode.OVERLAY_BREAKPOINT,
		"position": GraphNode.OVERLAY_POSITION,
	}},
}

const PROPERTY_GRID_CONTAINER := {}

const PROPERTY_MARGIN_CONTAINER := {}

const PROPERTY_PANEL_CONTAINER := {}

#const PROPERTY_SCRIPT_EDITOR := {}

const PROPERTY_SCROLL_CONTAINER := {}

#const PROPERTY_EDITOR_INSPECTOR := {}

const PROPERTY_SPLIT_CONTAINER := {
	"dragger_visibility": { "type": TYPE_INT, "literals": {
		"visible": SplitContainer.DRAGGER_VISIBLE,
		"hidden": SplitContainer.DRAGGER_HIDDEN,
		"hidden_collapsed": SplitContainer.DRAGGER_HIDDEN_COLLAPSED,
			"collapsed": SplitContainer.DRAGGER_HIDDEN_COLLAPSED,
	}},
}

const PROPERTY_HSPLIT_CONTAINER := {
	"grabber": { "type": "Texture" },
}

const PROPERTY_VSPLIT_CONTAINER := {
	"grabber": { "type": "Texture" },
}

const PROPERTY_TAB_CONTAINER := {
	"tab_align": { "type": TYPE_INT, "literals": {
		"left": TabContainer.ALIGN_LEFT,
		"center": TabContainer.ALIGN_CENTER,
		"right": TabContainer.ALIGN_RIGHT,
	}},
}

const PROPERTY_VIEWPORT_CONTAINER := {}

const PROPERTY_GRAPH_EDIT := {}

const PROPERTY_ITEM_LIST := {
	"icon_mode": { "type": TYPE_INT, "literals": {
		"top": ItemList.ICON_MODE_TOP,
		"left": ItemList.ICON_MODE_LEFT,
	}},
	"select_mode": { "type": TYPE_INT, "literals": {
		"single": ItemList.SELECT_SINGLE,
		"multi": ItemList.SELECT_MULTI,
			"multiple": ItemList.SELECT_MULTI,
	}},
}

const PROPERTY_LABEL := {
	"align": { "type": TYPE_INT, "literals": {
		"left": Label.ALIGN_LEFT,
		"center": Label.ALIGN_CENTER,
		"right": Label.ALIGN_RIGHT,
		"fill": Label.ALIGN_FILL,
	}},
	"valign": { "type": TYPE_INT, "literals": {
		"top": Label.VALIGN_TOP,
		"center": Label.VALIGN_CENTER,
		"bottom": Label.VALIGN_BOTTOM,
		"fill": Label.VALIGN_FILL,
	}},
}

const PROPERTY_LINE_EDIT := {
	"align": { "type": TYPE_INT, "literals": {
		"left": LineEdit.ALIGN_LEFT,
		"center": LineEdit.ALIGN_CENTER,
		"right": LineEdit.ALIGN_RIGHT,
		"fill": LineEdit.ALIGN_FILL,
	}},
	"right_icon": { "type": "Texture" },
}

const PROPERTY_NINE_PATCH_RECT := {
	"axis_stretch_horizontal": { "type": TYPE_INT, "literals": {
		"stretch": NinePatchRect.AXIS_STRETCH_MODE_STRETCH,
		"tile": NinePatchRect.AXIS_STRETCH_MODE_TILE,
		"tile_fit": NinePatchRect.AXIS_STRETCH_MODE_TILE_FIT,
			"fit": NinePatchRect.AXIS_STRETCH_MODE_TILE_FIT,
	}},
	"axis_stretch_vertical": { "type": TYPE_INT, "literals": {
		"stretch": NinePatchRect.AXIS_STRETCH_MODE_STRETCH,
		"tile": NinePatchRect.AXIS_STRETCH_MODE_TILE,
		"tile_fit": NinePatchRect.AXIS_STRETCH_MODE_TILE_FIT,
			"fit": NinePatchRect.AXIS_STRETCH_MODE_TILE_FIT,
	}},
	"region_rect": { "type": "Rect2" },
	"texture": { "type": "Texture" },
}

const PROPERTY_PANEL := {}

const PROPERTY_POPUP := {}

const PROPERTY_POPUP_DIALOG := {}

const PROPERTY_POPUP_MENU := {}

const PROPERTY_POPUP_PANEL := {}

const PROPERTY_WINDOW_DIALOG := {}

const PROPERTY_ACCEPT_DIALOG := {}

const PROPERTY_CONFIRMATION_DIALOG := {}

const PROPERTY_EDITOR_FILE_DIALOG := {
	"access": { "type": TYPE_INT, "literals": {
		"resources": EditorFileDialog.ACCESS_RESOURCES,
		"userdata": EditorFileDialog.ACCESS_USERDATA,
		"filesystem": EditorFileDialog.ACCESS_FILESYSTEM,
	}},
	"display_mode": { "type": TYPE_INT, "literals": {
		"thumbnails": EditorFileDialog.DISPLAY_THUMBNAILS,
		"list": EditorFileDialog.DISPLAY_LIST,
	}},
	"mode": { "type": TYPE_INT, "literals": {
		"open_file": EditorFileDialog.MODE_OPEN_FILE,
		"open_files": EditorFileDialog.MODE_OPEN_FILES,
		"open_dir": EditorFileDialog.MODE_OPEN_DIR,
		"open_any": EditorFileDialog.MODE_OPEN_ANY,
		"save_file": EditorFileDialog.MODE_SAVE_FILE,
	}},
}

const PROPERTY_FILE_DIALOG := {
	"access": { "type": TYPE_INT, "literals": {
		"resources": FileDialog.ACCESS_RESOURCES,
		"userdata": FileDialog.ACCESS_USERDATA,
		"filesystem": FileDialog.ACCESS_FILESYSTEM,
	}},
	"mode": { "type": TYPE_INT, "literals": {
		"open_file": FileDialog.MODE_OPEN_FILE,
		"open_files": FileDialog.MODE_OPEN_FILES,
		"open_dir": FileDialog.MODE_OPEN_DIR,
		"open_any": FileDialog.MODE_OPEN_ANY,
		"save_file": FileDialog.MODE_SAVE_FILE,
	}},
}

const PROPERTY_SCRIPT_CREATE_DIALOG := {}

const PROPERTY_RANGE := {}

const PROPERTY_EDITOR_SPIN_SLIDER := {}

const PROPERTY_PROGRESS_BAR := {}

const PROPERTY_SCROLL_BAR := {}

const PROPERTY_HSCROLL_BAR := {}

const PROPERTY_VSCROLL_BAR := {}

const PROPERTY_SLIDER := {}

const PROPERTY_HSLIDER := {}

const PROPERTY_VSLIDER := {}

const PROPERTY_SPIN_BOX := {
	"align": { "type": TYPE_INT, "literals": {
		"left": LineEdit.ALIGN_LEFT,
		"center": LineEdit.ALIGN_CENTER,
		"right": LineEdit.ALIGN_RIGHT,
		"fill": LineEdit.ALIGN_FILL,
	}},
}

const PROPERTY_TEXTURE_PROGRESS := {
	"fill_mode": { "type": TYPE_INT, "literals": {
		"left_to_right": TextureProgress.FILL_LEFT_TO_RIGHT,
		"right_to_left": TextureProgress.FILL_RIGHT_TO_LEFT,
		"top_to_bottom": TextureProgress.FILL_TOP_TO_BOTTOM,
		"bottom_to_top": TextureProgress.FILL_BOTTOM_TO_TOP,
		"clockwise": TextureProgress.FILL_CLOCKWISE,
		"counter_clockwise": TextureProgress.FILL_COUNTER_CLOCKWISE,
		"bilinear_left_right": TextureProgress.FILL_BILINEAR_LEFT_AND_RIGHT,
		"bilinear_top_bottom": TextureProgress.FILL_BILINEAR_TOP_AND_BOTTOM,
		"clockwise_counter_clockwise": TextureProgress.FILL_CLOCKWISE_AND_COUNTER_CLOCKWISE,
	}},
	"texture_over": { "type": "Texture" },
	"texture_progress": { "type": "Texture" },
	"texture_under": { "type": "Texture" },
}

const PROPERTY_REFERENCE_RECT := {}

const PROPERTY_RICH_TEXT_LABEL := {}

const PROPERTY_SEPARATOR := {}

const PROPERTY_HSEPARATOR := {}

const PROPERTY_VSEPARATOR := {}

const PROPERTY_TABS := {
	"tab_align": { "type": TYPE_INT, "literals": {
		"left": Tabs.ALIGN_LEFT,
		"center": Tabs.ALIGN_CENTER,
		"right": Tabs.ALIGN_RIGHT,
		"max": Tabs.ALIGN_MAX,
	}},
	"tab_close_display_policy": { "type": TYPE_INT, "literals": {
		"show_never": Tabs.CLOSE_BUTTON_SHOW_NEVER,
		"show_active_only": Tabs.CLOSE_BUTTON_SHOW_ACTIVE_ONLY,
		"show_always": Tabs.CLOSE_BUTTON_SHOW_ALWAYS,
		"max": Tabs.CLOSE_BUTTON_MAX,
	}},
}

const PROPERTY_TEXT_EDIT := {}

const PROPERTY_TEXTURE_RECT := {
	"stretch_mode": { "type": TYPE_INT, "literals": {
		"scale_on_demand": TextureRect.STRETCH_SCALE_ON_EXPAND,
		"scale": TextureRect.STRETCH_SCALE,
		"tile": TextureRect.STRETCH_TILE,
		"keep": TextureRect.STRETCH_KEEP,
		"keep_centered": TextureRect.STRETCH_KEEP_CENTERED,
		"keep_aspect": TextureRect.STRETCH_KEEP_ASPECT,
		"keep_aspect_centered": TextureRect.STRETCH_KEEP_ASPECT_CENTERED,
		"keep_aspect_covered": TextureRect.STRETCH_KEEP_ASPECT_COVERED,
	}},
	"texture": { "type": "Texture" },
}

const PROPERTY_TREE :=  {
	"drop_mode_flags": { "type": TYPE_INT, "mask": {
		"disabled": Tree.DROP_MODE_DISABLED,
		"on_item": Tree.DROP_MODE_ON_ITEM,
		"inbetween": Tree.DROP_MODE_INBETWEEN,
	}},
	"select_mode": { "type": TYPE_INT, "literals": {
		"single": Tree.SELECT_SINGLE,
		"row": Tree.SELECT_ROW,
		"multi": Tree.SELECT_MULTI,
	}},
}

const PROPERTY_VIDEO_PLAYER := {
	"stream": { "type": "VideoStream" },
}

export (String, FILE, "*.xml") var interface_file
export (String, FILE, "*.tscn") var save_file

# The XML parser object.
onready var xml_parser := XMLParser.new()

onready var custom_properties := {
	"Node": PROPERTY_NODE,
	"CanvasItem": PROPERTY_CANVAS_ITEM,
	"Control": PROPERTY_CONTROL,
	"BaseButton": PROPERTY_BASE_BUTTON,
	"Button": PROPERTY_BUTTON,
	"CheckBox": PROPERTY_CHECK_BOX,
	"CheckButton": PROPERTY_CHECK_BUTTON,
	"ColorPickerButton": PROPERTY_COLOR_PICKER_BUTTON,
	"MenuButton": PROPERTY_MENU_BUTTON,
	"OptionButton": PROPERTY_OPTION_BUTTON,
	"ToolButton": PROPERTY_TOOL_BUTTON,
	"LinkButton": PROPERTY_LINK_BUTTON,
	"TextureButton": PROPERTY_TEXTURE_BUTTON,
	"ColorRect": PROPERTY_COLOR_RECT,
	"Container": PROPERTY_CONTAINER,
	"BoxContainer": PROPERTY_BOX_CONTAINER,
	"ColorPicker": PROPERTY_COLOR_PICKER,
	"HBoxContainer": PROPERTY_HBOX_CONTAINER,
	"VBoxContainer": PROPERTY_VBOX_CONTAINER,
	"CenterContainer": PROPERTY_CENTER_CONTAINER,
	"EditorProperty": PROPERTY_EDITOR_PROPERTY,
	"GraphNode": PROPERTY_GRAPH_NODE,
	"GridContainer": PROPERTY_GRID_CONTAINER,
	"MarginContainer": PROPERTY_MARGIN_CONTAINER,
	"PanelContainer": PROPERTY_PANEL_CONTAINER,
#	"ScriptEditor": PROPERTY_SCRIPT_EDITOR,
	"ScrollContainer": PROPERTY_SCROLL_CONTAINER,
#	"EditorInspector": PROPERTY_EDITOR_INSPECTOR,
	"SplitContainer": PROPERTY_SPLIT_CONTAINER,
	"HSplitContainer": PROPERTY_HSPLIT_CONTAINER,
	"VSplitContainer": PROPERTY_VSPLIT_CONTAINER,
	"TabContainer": PROPERTY_TAB_CONTAINER,
	"ViewportContainer": PROPERTY_VIEWPORT_CONTAINER,
	"GraphEdit": PROPERTY_GRAPH_EDIT,
	"ItemList": PROPERTY_ITEM_LIST,
	"Label": PROPERTY_LABEL,
	"LineEdit": PROPERTY_LINE_EDIT,
	"NinePatchRect": PROPERTY_NINE_PATCH_RECT,
	"Panel": PROPERTY_PANEL,
	"Popup": PROPERTY_POPUP,
	"PopupDialog": PROPERTY_POPUP_DIALOG,
	"PopupMenu": PROPERTY_POPUP_MENU,
	"PopupPanel": PROPERTY_POPUP_PANEL,
	"WindowDialog": PROPERTY_WINDOW_DIALOG,
	"AcceptDialog": PROPERTY_ACCEPT_DIALOG,
	"ConfirmationDialog": PROPERTY_CONFIRMATION_DIALOG,
	"EditorFileDialog": PROPERTY_EDITOR_FILE_DIALOG,
	"FileDialog": PROPERTY_FILE_DIALOG,
	"ScriptCreateDialog": PROPERTY_SCRIPT_CREATE_DIALOG,
	"Range": PROPERTY_RANGE,
	"EditorSpinSlider": PROPERTY_EDITOR_SPIN_SLIDER,
	"ProgressBar": PROPERTY_PROGRESS_BAR,
	"ScrollBar": PROPERTY_SCROLL_BAR,
	"HScrollBar": PROPERTY_HSCROLL_BAR,
	"VScrollBar": PROPERTY_VSCROLL_BAR,
	"Slider" : PROPERTY_SLIDER,
	"HSlider": PROPERTY_HSLIDER,
	"VSlider": PROPERTY_VSLIDER,
	"SpinBox": PROPERTY_SPIN_BOX,
	"TextureProgress": PROPERTY_TEXTURE_PROGRESS,
	"ReferenceRect": PROPERTY_REFERENCE_RECT,
	"RichTextLabel": PROPERTY_RICH_TEXT_LABEL,
	"Separator": PROPERTY_SEPARATOR,
	"HSeparator": PROPERTY_HSEPARATOR,
	"VSeparator": PROPERTY_VSEPARATOR,
	"Tabs": PROPERTY_TABS,
	"TextEdit": PROPERTY_TEXT_EDIT,
	"TextureRect": PROPERTY_TEXTURE_RECT,
	"Tree": PROPERTY_TREE,
	"VideoPlayer": PROPERTY_VIDEO_PLAYER
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
					# "boxcontainer", "box": new_node = BoxContainer.new()
					"colorpicker": new_node = ColorPicker.new()
					"hboxcontainer", "hbox": new_node = HBoxContainer.new()
					"vboxcontainer", "vbox": new_node = VBoxContainer.new()
					"centercontainer", "center": new_node = CenterContainer.new()
					"editorproperty": new_node = EditorProperty.new()
					"graphnode": new_node = GraphNode.new()
					"gridcontainer", "grid": new_node = GridContainer.new()
					"margincontainer", "margin": new_node = MarginContainer.new()
					"panelcontainer": new_node = PanelContainer.new()
					"scrollcontainer": new_node = ScrollContainer.new()
					# "splitcontainer": new_node = SplitContainer.new()
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
					"editorfiledialog", "editorfile": new_node = EditorFileDialog.new()
					"filedialog", "file": new_node = FileDialog.new()
					"scriptcreatedialog": new_node = ScriptCreateDialog.new()
					# "range": new_node = Range.new()
					"editorspinslider": new_node = EditorSpinSlider.new()
					"progressbar", "progress": new_node = ProgressBar.new()
					# "scrollbar": new_node = ScrollBar.new()
					"hscrollbar": new_node = HScrollBar.new()
					"vscrollbar": new_node = VScrollBar.new()
					# "slider": new_node = Slider.new()
					"hslider": new_node = HSlider.new()
					"vslider": new_node = VSlider.new()
					"spinbox": new_node = SpinBox.new()
					"textureprogress": new_node = TextureProgress.new()
					"referencerect": new_node = ReferenceRect.new()
					"richtextlabel", "richlabel": new_node = RichTextLabel.new()
					"separator": new_node = Separator.new()
					"hseparator": new_node = HSeparator.new()
					"vseparator": new_node = VSeparator.new()
					"tabs": new_node = Tabs.new()
					"textedit": new_node = TextEdit.new()
					"texturerect", "texture": new_node = TextureRect.new()
					"videoplayer", "video": new_node = VideoPlayer.new()
					_: new_node = null

				if not new_node:
					printerr("Unsupported node %s" % xml_node_name)
					get_tree().quit()

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
					if custom_properties.has(node_class):
						# Loop over every class to see if there are custom properties for the current class hierarchy.
						for current_node_class in custom_properties:
							if new_node.is_class(current_node_class):
								var node_properties:Dictionary = custom_properties[current_node_class]
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
		TYPE_VECTOR2: converted_value = _xml_attr_to_vector2(xml_value)
		TYPE_RECT2: converted_value = _xml_attr_to_rect2(xml_value)
		#
		TYPE_OBJECT: pass # We handle objects separately below depending on their actual
						 # (named) type.
		#
		TYPE_STRING_ARRAY: converted_value = _xml_attr_to_poolstringarray(xml_value)
		# Named object types
		TYPE_MATERIAL: converted_value = load(str(xml_value))
		TYPE_TEXTURE: converted_value = load(str(xml_value))
		TYPE_THEME: converted_value = load(str(xml_value))
		TYPE_VIDEO_STREAM: converted_value = load(str(xml_value))
		_:
			printerr("Don't know what to do with value!", xml_value, property_type)
			converted_value = str(xml_value)

	return converted_value

# @TODO
func _xml_attr_to_vector2(xml_value:String) -> Vector2:
	print(xml_value)
	return Vector2.ZERO

# @TODO
func _xml_attr_to_rect2(xml_value:String) -> Rect2:
	print(xml_value)
	return Rect2(Vector2.ZERO, Vector2.ZERO)

# @TODO
func _xml_attr_to_poolstringarray(xml_value:String) -> PoolStringArray:
	print(xml_value)
	return PoolStringArray([])

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
