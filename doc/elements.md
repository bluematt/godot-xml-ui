# XML element list

Like their Godot counterparts, all elements extend from the `<control>` element/`Control` class and, of course, ultimately from `Node`.

For full documentation on default values and how the attributes affect the resulting node, see the documentation for the specific node in the [Godot API](https://docs.godotengine.org/en/stable/classes/).

## Control inheritance

**Note:** Not all elements can be instantiated as nodes.  These are presented ~~`<likethis>`~~.

* [~~`<node>`~~](#Node)
  * [~~`<canvasitem>`~~](#CanvasItem)
    * [`<control>`](#Control)
      * [~~`<basebutton>`~~](#BaseButton)
        * [`<button>`](#Button)
          * [`<checkbox>`](#CheckBox)
          * [`<checkbutton>`](#CheckButton)
          * [`<colorpickerbutton>`](#ColorPickerButton)
          * [`<menubutton>`](#MenuButton)
          * [`<optionbutton>`](#OptionButton)
          * [`<toolbutton>`](#ToolButton)
        * [`<linkbutton>`](#LinkButton)
        * [`<texturebutton>`](#TextureButton)
      * [`<colorrect>`](#ColorRect)
      * [`<container>`](#Container)
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

**Note:** Some attributes/properties are not supported because they are read-only or require advanced functionality that should be provided in the Godot Editor.  Attempting to set these attributes will result in an error message.

## Attribute values

When an attribute is presented in chevrons/angle brackets (`<` `>`) the value should be of that type.  For example:

```xml
<control width="<float>"/>
<control horizontal_offset="<int>"/>
<control name="<String>"/>
<control position="<Vector2>"/>
```

the attribute should be a `float`:

```xml
<control width="2.50"/>
<control horizontal_offset="10"/>
<control name="MyRootNode"/>
<control position="(100, 200)"/>
```

When an attibute has multiple options separated by a pipe (`|`) character, at most one option should be provided.  For example:

```xml
<label align="left|center|right"/>
```

the attribute should be one of the provided options:

```xml
<label align="center"/>
```

When an attibute has multiple options wrapped in (square) brackets, any number of these options can be supplied.  For example:

```xml
<button button_mask="[left][center][right]"/>
```

the attribute should be zero or more of the provided options, separated by a single space character:

```xml
<button button_mask="left right"/>
```

---

## BaseButton

> Base class for different kinds of buttons.

Inherits:
[`<control>`](#Control) &lt;
~~[`<canvasitem>`](#CanvasItem)~~ &lt;
~~[`<node>`](#Node)~~

Inherited by:
[`<button>`](#Button)

**Note:** This element cannot be instantiated directly.

### Attributes

```xml
<basebutton
        action_mode="press|release"
        button_mask="[left][right]"
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

Tag:
`<button>`

Inherits:
~~[`<basebutton>`](#BaseButton)~~ &lt;
[`<control>`](#Control) &lt;
~~[`<canvasitem>`](#CanvasItem)~~ &lt;
~~[`<node>`](#Node)~~

Inherited by:
[`<checkbox>`](#CheckBox)
[`<checkbutton>`](#CheckButton)
[`<colorpickerbutton>`](#ColorPickerButton)
[`<menubutton>`](#MenuButton)
[`<optionbutton>`](#OptionButton)
[`<toolbutton>`](#ToolButton)

### Attributes

```xml
<button/>
```

See: https://docs.godotengine.org/en/stable/classes/class_basebutton.html

## CanvasItem

> Base class of anything 2D.

Inherits:
~~[`<node>`](#Node)~~

Inherited by:
[`<control>`](#Control)

**Note:** This element cannot be instantiated directly.

### Attributes

```xml
<canvasitem
        light_mask="<int>"
        material="<Material>"
        modulate="<Color>"
        self_modulate="<Color>"
        show_behind_parent="true|false"
        show_on_top="true|false"
        use_parent_material="true|false"
        visible="true|false"/>
```

See: https://docs.godotengine.org/en/stable/classes/class_canvasitem.html

## CheckBox

> Binary choice user interface widget. See also [`<checkbutton>`](#CheckButton).

Tag:
`<checkbox>`

Inherits:
[`<button>`](#Button) &lt;
~~[`<basebutton>`](#BaseButton)~~ &lt;
[`<control>`](#Control) &lt;
~~[`<canvasitem>`](#CanvasItem)~~ &lt;
~~[`<node>`](#Node)~~

### Attributes

```xml
<checkbox/>
```

See: https://docs.godotengine.org/en/stable/classes/class_checkbox.html

## Control

> All user interface nodes inherit from Control. A control's anchors and margins adapt its position and size relative to its parent.

Tag:
`<control>`

Inherits:
[`<canvasitem>`](#CanvasItem) &lt;
[`<node>`](#Node)

### Attributes

```xml
<control
    name="<String>"
    *layout="topleft|topright|bottomright|bottomleft|
            centerleft|centertop|centerright|centerbottom|
            center|
            leftwide|topwide|rightwide|bottomwide|
            vcenterwide|hcenterwide|
            fullrect"
    anchor_bottom = "<float>"
    anchor_left = "<float>"
    anchor_right = "<float>"
    anchor_top = "<float>"
    focus_mode = "none|click|all"
    focus_neighbour_bottom="<NodePath>"
    focus_neighbour_left="<NodePath>"
    focus_neighbour_right="<NodePath>"
    focus_neighbour_top="<NodePath>"
    focus_next="<NodePath>"
    focus_previous="<NodePath>"
    grow_horizontal="begin|end|both"
    grow_vertical="begin|end|both"
    hint_tooltip="<String>"
    margin_bottom="<float>"
    margin_left="<float>"
    margin_right="<float>"
    margin_top="<float>"
    mouse_default_cursor_shape="arrow|ibeam|pointing_hand|
            cross|wait|busy|drag|can_drop|forbidden|
            vsize|hsize|bdiagsize|fdiagsize|
            move|vsplit|hsplit|help"
    mouse_filter="stop|pass|ignore"
    rect_clip_content="true|false"
    rect_min_size="<Vector2>"
    rect_pivot_offset="<Vector2>"
    rect_rotation="<float>"
    rect_scale="<Vector2>"
    size_flags_horizontal="[fill][expand][shrink_center][shrink_end]"
    size_flags_vertical="[fill][expand][shrink_center][shrink_end]"
    size_flags_stretch_ratio="[float]"
    theme="<Theme>"/>
```

**Note:** The `layout` attribute is a convenience for automatically setting the various `anchor_*` attributes using the same values provided by the [Layout menu](https://docs.godotengine.org/en/stable/getting_started/step_by_step/ui_game_user_interface.html) for Control nodes in the Godot editor.

See: https://docs.godotengine.org/en/stable/classes/class_control.html

## Node

> Base class for all scene objects.

Inherits:
*None*

Inherited by:
~~[`<canvasitem>`](#CanvasItem)~~

**Note:** This element cannot be instantiated directly.

### Attributes

```xml
<node
        name="<String>"
        pause_mode="inherit|stop|process"
        process_priority="<int>"
/>
```

See: https://docs.godotengine.org/en/stable/classes/class_node.html