# XML element list

Like their Godot counterparts, all elements extend from the `<control>` element/`Control` class (and, of course, ultimately from `Node`).

For full documentation on default values and how the attribute affects the resulting node, see the appropriate documentation for that node in the [Godot API](https://docs.godotengine.org/en/stable/classes/).

## Control inheritance

**Note:** Not all elements can be instantiated as nodes.  These are presented ~~`<likethis>`~~.

* [~~`<node>`~~](#Node)
  * [~~`<canvasitem>`~~](#CanvasItem)
    * [`<control>`](#Control)
      * [~~`<basebutton>`~~](#BaseButton)
        * [`<button>`](#Button)
          * `<checkbox>`
          * `<checkbutton>`
          * `<colorpickerbutton>`
          * `<menubutton>`
          * `<optionbutton>`
          * `<toolbutton>`
        * `<linkbutton>`
        * `<texturebutton>`
      * `<colorrect>`
      * `<container>`
        * ~~`<boxcontainer>`~~
          * `<colorpicker>`
          * `<hboxcontainer>` (aliased as `<hbox>`)
          * `<vboxcontainer>` (aliased as `<vbox>`)
        * `<centercontainer>` (aliased as `<center>`)
        * `<graphnode>`
        * `<gridcontainer>` (aliased as `<grid>`)
        * `<margincontainer>` (aliased as `<margin>`)
        * `<panelcontainer>`
        * `<scrollcontainer>`
        * ~~`<splitcontainer>`~~
          * `<hsplitcontainer>`
          * `<vsplitcontainer>`
        * `<tabcontainer>`
        * `<viewportcontainer>`
      * `<graphedit>`
      * `<itemlist>`
      * `<label>`
      * `<lineedit>`
      * `<ninepatchrect>`
      * `<panel>`
      * `<popup>`
        * `<popupdialog>`
        * `<popupmenu>`
        * `<popuppanel>`
        * `<windowdialog>`
          * `<acceptdialog>`
            * `<confirmationdialog>`
              * `<filedialog>`
      * ~~`<range>`~~
        * `<progressbar>`
        * ~~`<scrollbar>`~~
          * `<hscrollbar>`
          * `<vscrollbar>`
        * ~~`<slider>`~~
          * `<hslider>`
          * `<vslider>`
        * `<spinbox>`
        * `<textureprogress>`
      * `<referencerect>`
      * `<richtextlabel>`
      * ~~`<separator>`~~
        * `<hseparator>`
        * `<vseparator>`
      * `<tabs>`
      * `<textedit>`
      * `<texturerect>`
      * `<tree>`
      * `<videoplayer>`

---

## BaseButton

**Note:** `<basebutton>` cannot be instantiated directly.  The attributes described below are inherited by the following derived elements:

* `<button>` @TODO

Inherits: [`<control>`](#Control).

### Attributes

```xml
<basebutton
        action_mode="press|release"
        button_mask="[left] [right]"
        disabled="true|false"
        enabled_focus_mode="none|click|all"
        focus_mode="none|click|all"
        group="[ButtonGroup]"
        keep_pressed_outside="true|false"
        pressed="true|false"
        shortcut="[ShortCut]"
        shortcut_in_tooltip="true|false"
        toggle_mode="true|false"/>
```

## Button

Tag: `<button>`

Inherits: [`<basebutton>`](#BaseButton).

### Attributes

```xml
<button>...</button>
```

See: https://docs.godotengine.org/en/stable/classes/class_basebutton.html

## CanvasItem

Tag: `<canvasitem>`

Inherits ~~[`<node>`](#Node)~~.

### Attributes

```xml
<canvasitem
        light_mask="[int]"
        material="[Material]"
        modulate="[Color]"
        self_modulate="[Color]"
        show_behind_parent="true|false"
        show_on_top="true|false"
        use_parent_material="true|false"
        visible="true|false"/>
```

See: https://docs.godotengine.org/en/stable/classes/class_canvasitem.html

## Control

Inherits [`<canvasitem>`](#CanvasItem).

### Attributes

```xml
<control
    name="[String]"
    *layout="topleft|topright|bottomright|bottomleft|
            centerleft|centertop|centerright|centerbottom|
            center|
            leftwide|topwide|rightwide|bottomwide|
            vcenterwide|hcenterwide|
            fullrect"
    anchor_bottom = "[float]"
    anchor_left = "[float]"
    anchor_right = "[float]"
    anchor_top = "[float]"
    focus_mode = "none|click|all"
    focus_neighbour_bottom="[NodePath]"
    focus_neighbour_left="[NodePath]"
    focus_neighbour_right="[NodePath]"
    focus_neighbour_top="[NodePath]"
    focus_next="[NodePath]"
    focus_previous="[NodePath]"
    grow_horizontal="begin|end|both"
    grow_vertical="begin|end|both"
    hint_tooltip="[String]"
    margin_bottom="[float]"
    margin_left="[float]"
    margin_right="[float]"
    margin_top="[float]"
    mouse_default_cursor_shape="arrow|ibeam|pointing_hand|
            cross|wait|busy|drag|can_drop|forbidden|
            vsize|hsize|bdiagsize|fdiagsize|
            move|vsplit|hsplit|help"
    mouse_filter="stop|pass|ignore"
    rect_clip_content="true|false"
    rect_global_position="[Vector2]"
    rect_min_size="[Vector2]"
    rect_pivot_offset="[Vector2]"
    rect_position="[Vector2]"
    rect_rotation="[float]"
    rect_scale="[Vector2]"
    rect_size="[Vector2]"
    size_flags_horizontal="[fill][expand][shrink_center][shrink_end]"
    size_flags_vertical="[fill][expand][shrink_center][shrink_end]"
    size_flags_stretch_ratio="[float]"
    theme="[Theme]"/>
```

**Note:** The `layout` attribute is a convenience for automatically setting the various `anchor_*` attributes using the same values as [Layout menu](https://docs.godotengine.org/en/stable/getting_started/step_by_step/ui_game_user_interface.html) for Control nodes in the Godot editor.

See: https://docs.godotengine.org/en/stable/classes/class_control.html

## Node

Inherits: nothing

See: https://docs.godotengine.org/en/stable/classes/class_node.html

### Attributes

```xml
<node
        custom_multiplayer="[*unsupported]"
        filename="[*unsupported]"
        multiplayer="[*unsupported]"
        name="[String]"
        owner="[*unsupported]"
        pause_mode="inherit|stop|process"
        process_priority="[int]"
/>
```

**Note:** Some attributes are not supported because they require advanced functionality.  Attempting to set these attributes will result in an error.