class_name Properties
extends Node

const PROPERTY_TYPE_BITMAP = { "type": "BitMap" }
const PROPERTY_TYPE_BUTTON_GROUP = { "type": "ButtonGroup" }
const PROPERTY_TYPE_MATERIAL = { "type": "Material" }
const PROPERTY_TYPE_NODEPATH = { "type": "NodePath" }
const PROPERTY_TYPE_SHORT_CUT = { "type": "ShortCut" }
const PROPERTY_TYPE_STRING = { "type": TYPE_STRING }
const PROPERTY_TYPE_TEXTURE = { "type": "Texture" }
const PROPERTY_TYPE_THEME = { "type": "Theme" }
const PROPERTY_TYPE_VIDEO_STREAM = { "type": "VideoStream" }

const NODE := {
	"name": PROPERTY_TYPE_STRING,
	"pause_mode": { "type": TYPE_INT, "literals": {
		"inherit": Node.PAUSE_MODE_INHERIT,
		"stop": Node.PAUSE_MODE_STOP,
		"process": Node.PAUSE_MODE_PROCESS,
	}},
	"__unsupported": [
		"custom_multiplayer",
		"filename",
		"multiplayer",
		"owner",
	],
	"__signals": [
		"ready",
		"renamed",
		"tree_entered",
		"tree_exited",
		"tree_exiting",
	],
}

const CANVAS_ITEM := {
	"material": PROPERTY_TYPE_MATERIAL,
}

const CONTROL := {
	"focus_mode": { "type": TYPE_INT, "literals": {
		"none": Control.FOCUS_NONE,
		"click": Control.FOCUS_CLICK,
		"all": Control.FOCUS_ALL,
	}},
	"focus_neighbour_bottom": PROPERTY_TYPE_NODEPATH,
	"focus_neighbour_left": PROPERTY_TYPE_NODEPATH,
	"focus_neighbour_right": PROPERTY_TYPE_NODEPATH,
	"focus_neighbour_top": PROPERTY_TYPE_NODEPATH,
	"focus_next": PROPERTY_TYPE_NODEPATH,
	"focus_previous": PROPERTY_TYPE_NODEPATH,
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
			"default": Control.CURSOR_ARROW, # alias
			"pointer": Control.CURSOR_ARROW, # alias
		"ibeam": Control.CURSOR_IBEAM,
			"text": Control.CURSOR_IBEAM, # alias
			"input": Control.CURSOR_IBEAM, # alias
		"pointing_hand": Control.CURSOR_POINTING_HAND,
			"hand": Control.CURSOR_POINTING_HAND, # alias
		"cross": Control.CURSOR_CROSS,
		"wait": Control.CURSOR_WAIT,
		"busy": Control.CURSOR_BUSY,
		"drag": Control.CURSOR_DRAG,
		"can_drop": Control.CURSOR_CAN_DROP,
			"drop": Control.CURSOR_CAN_DROP, # alias
		"forbidden": Control.CURSOR_FORBIDDEN,
		"vsize": Control.CURSOR_VSIZE,
			"v-size": Control.CURSOR_VSIZE, # alias
		"hsize": Control.CURSOR_HSIZE,
			"h-size": Control.CURSOR_HSIZE, # alias
		"bdiagsize": Control.CURSOR_BDIAGSIZE,
			"bltr-size": Control.CURSOR_BDIAGSIZE, # alias
		"fdiagsize": Control.CURSOR_FDIAGSIZE,
			"tlbr-size": Control.CURSOR_FDIAGSIZE, # alias
		"move": Control.CURSOR_MOVE,
		"vsplit": Control.CURSOR_VSPLIT,
			"v-split": Control.CURSOR_VSPLIT, # alias
		"hsplit": Control.CURSOR_HSPLIT,
			"h-split": Control.CURSOR_HSPLIT, # alias
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
	"theme": PROPERTY_TYPE_THEME,
	"layout": { "calculated": true },
}

const BASE_BUTTON := {
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
	"group": PROPERTY_TYPE_BUTTON_GROUP,
	"shortcut": PROPERTY_TYPE_SHORT_CUT,
}

const BUTTON := {
	"align": { "type": TYPE_INT, "literals": {
		"left": Button.ALIGN_LEFT,
		"center": Button.ALIGN_CENTER,
		"right": Button.ALIGN_RIGHT,
	}},
	"icon": PROPERTY_TYPE_TEXTURE,
}


const CHECK_BOX := {}

const CHECK_BUTTON := {}

const COLOR_PICKER_BUTTON := {}

const MENU_BUTTON := {}

const OPTION_BUTTON := {}

const TOOL_BUTTON := {}

const LINK_BUTTON := {
	"underline": { "type": TYPE_INT, "literals": {
		"always": LinkButton.UNDERLINE_MODE_ALWAYS,
		"hover": LinkButton.UNDERLINE_MODE_ON_HOVER,
		"on_hover": LinkButton.UNDERLINE_MODE_ON_HOVER,
		"never": LinkButton.UNDERLINE_MODE_NEVER,
	}},
}


const TEXTURE_BUTTON := {
	"stretch_mode": { "type": TYPE_INT, "literals": {
		"scale": TextureButton.STRETCH_SCALE,
		"tile": TextureButton.STRETCH_TILE,
		"keep": TextureButton.STRETCH_KEEP,
		"keep_centered": TextureButton.STRETCH_KEEP_CENTERED,
		"keep_aspect": TextureButton.STRETCH_KEEP_ASPECT,
		"keep_aspect_centered": TextureButton.STRETCH_KEEP_ASPECT_CENTERED,
		"keep_aspect_covered": TextureButton.STRETCH_KEEP_ASPECT_COVERED,
	}},
	"texture_click_mask": PROPERTY_TYPE_BITMAP,
	"texture_disabled	": PROPERTY_TYPE_TEXTURE,
	"texture_focused": PROPERTY_TYPE_TEXTURE,
	"texture_hover": PROPERTY_TYPE_TEXTURE,
	"texture_normal": PROPERTY_TYPE_TEXTURE,
	"texture_pressed": PROPERTY_TYPE_TEXTURE,
}

const COLOR_RECT := {}

const CONTAINER := {}

const BOX_CONTAINER := {
	"alignment": { "type": TYPE_INT, "literals": {
		"begin": BoxContainer.ALIGN_BEGIN,
		"center": BoxContainer.ALIGN_CENTER,
		"end": BoxContainer.ALIGN_END,
	}},
}

const COLOR_PICKER := {}

const HBOX_CONTAINER := {
	"separation": { "property": "custom_constants/separation", "type": TYPE_INT, },
}

const VBOX_CONTAINER := {
	"separation": { "property": "custom_constants/separation", "type": TYPE_INT, },
}

const CENTER_CONTAINER := {}

const EDITOR_PROPERTY := {}

const GRAPH_NODE := {
	"overlay": { "type": TYPE_INT, "literals": {
		"disabled": GraphNode.OVERLAY_DISABLED,
		"breakpoint": GraphNode.OVERLAY_BREAKPOINT,
		"position": GraphNode.OVERLAY_POSITION,
	}},
}

const GRID_CONTAINER := {}

const MARGIN_CONTAINER := {}

const PANEL_CONTAINER := {}

#const SCRIPT_EDITOR := {}

const SCROLL_CONTAINER := {}

#const EDITOR_INSPECTOR := {}

const SPLIT_CONTAINER := {
	"dragger_visibility": { "type": TYPE_INT, "literals": {
		"visible": SplitContainer.DRAGGER_VISIBLE,
		"hidden": SplitContainer.DRAGGER_HIDDEN,
		"hidden_collapsed": SplitContainer.DRAGGER_HIDDEN_COLLAPSED,
			"collapsed": SplitContainer.DRAGGER_HIDDEN_COLLAPSED, # alias
	}},
}

const HSPLIT_CONTAINER := {
	"grabber": PROPERTY_TYPE_TEXTURE,
}

const VSPLIT_CONTAINER := {
	"grabber": PROPERTY_TYPE_TEXTURE,
}

const TAB_CONTAINER := {
	"tab_align": { "type": TYPE_INT, "literals": {
		"left": TabContainer.ALIGN_LEFT,
		"center": TabContainer.ALIGN_CENTER,
		"right": TabContainer.ALIGN_RIGHT,
	}},
}

const VIEWPORT_CONTAINER := {}

const GRAPH_EDIT := {}

const ITEM_LIST := {
	"icon_mode": { "type": TYPE_INT, "literals": {
		"top": ItemList.ICON_MODE_TOP,
		"left": ItemList.ICON_MODE_LEFT,
	}},
	"select_mode": { "type": TYPE_INT, "literals": {
		"single": ItemList.SELECT_SINGLE,
		"multi": ItemList.SELECT_MULTI,
			"multiple": ItemList.SELECT_MULTI, # alias
	}},
}

const LABEL := {
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

const LINE_EDIT := {
	"align": { "type": TYPE_INT, "literals": {
		"left": LineEdit.ALIGN_LEFT,
		"center": LineEdit.ALIGN_CENTER,
		"right": LineEdit.ALIGN_RIGHT,
		"fill": LineEdit.ALIGN_FILL,
	}},
	"right_icon": PROPERTY_TYPE_TEXTURE,
}

const NINE_PATCH_RECT := {
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
	"texture": PROPERTY_TYPE_TEXTURE,
}

const PANEL := {}

const POPUP := {}

const POPUP_DIALOG := {}

const POPUP_MENU := {}

const POPUP_PANEL := {}

const WINDOW_DIALOG := {}

const ACCEPT_DIALOG := {}

const CONFIRMATION_DIALOG := {}

const EDITOR_FILE_DIALOG := {
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

const FILE_DIALOG := {
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

const SCRIPT_CREATE_DIALOG := {}

const RANGE := {}

const EDITOR_SPIN_SLIDER := {}

const PROGRESS_BAR := {}

const SCROLL_BAR := {}

const HSCROLL_BAR := {}

const VSCROLL_BAR := {}

const SLIDER := {}

const HSLIDER := {}

const VSLIDER := {}

const SPIN_BOX := {
	"align": { "type": TYPE_INT, "literals": {
		"left": LineEdit.ALIGN_LEFT,
		"center": LineEdit.ALIGN_CENTER,
		"right": LineEdit.ALIGN_RIGHT,
		"fill": LineEdit.ALIGN_FILL,
	}},
}

const TEXTURE_PROGRESS := {
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
	"texture_over": PROPERTY_TYPE_TEXTURE,
	"texture_progress": PROPERTY_TYPE_TEXTURE,
	"texture_under": PROPERTY_TYPE_TEXTURE,
}

const REFERENCE_RECT := {}

const RICH_TEXT_LABEL := {}

const SEPARATOR := {}

const HSEPARATOR := {}

const VSEPARATOR := {}

const TABS := {
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

const TEXT_EDIT := {}

const TEXTURE_RECT := {
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
	"texture": PROPERTY_TYPE_TEXTURE,
}

const TREE :=  {
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

const VIDEO_PLAYER := {
	"stream": PROPERTY_TYPE_VIDEO_STREAM,
}
