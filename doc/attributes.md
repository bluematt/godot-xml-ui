# Attributes

## Basic attributes

### `int`

```xml
<control margin_top="40"/>
<control margin_right="-80"/>
```

### `float`

```xml
<control width="123.5"/>
<control margin_bottom="-25.23"/>
```

### `String`

```xml
<control name="Foo"/>
<button text="Click Me!"/>
```

**Note:** To include a `\` or `"` character, it must be escaped:

```xml
<label text="Click \"Continue\" to continue."/>
<button text="Open C:\\"/>
```

## Advanced attributes

Advanced attributes are generally representations of Godot's own types or resources, for example [`Vector2`](#Vector2) or [`Texture`](#Texture).

### `ButtonGroup`

@TODO

### `Color`

Colors can be specified in a number of ways:

```xml
<!-- Using a HTML-style color specification -->
<colorrect color="#ff0000"/> <!-- Pure red -->

<!-- Using a HTML-style color specification with alpha -->
<colorrect color="#80ffffff"/> <!-- Semi-transparent pure white -->
<!-- Note: When using HTML-style color with alpha, the order is ARGB. -->

<!-- Using a named color from the Color class -->
<colorrect color="royalblue"/>

<!-- Using a 3- or 4-element tuple representing RGB(A) values -->
<colorrect color="(0.75, 0.25, 0.25)"/>
<colorrect color="(0.5, 0.5, 0.5, 1.0)"/>
```

**Note:** To use "supersaturated" colors, you must use the tuple style:

```xml
<colorrect color="(100.0, 100.0, 100.0)"/>
```

See: https://docs.godotengine.org/en/stable/classes/class_color.html

### `Material`

A `Material` attribute should contain a full path, using the `res://` or other Godot-specific protocol, to a resource.

```xml
<panel material="res://my_material.tres"/>
```

See: https://docs.godotengine.org/en/stable/classes/class_material.html

**Note:** The existence of the resource is *not* checked.

### `NodePath`

A `NodePath` should reference a relative or absolute path to a node using Godot's `@` notation.

**Note**: Quotation marks `"` are not required, and will be added automatically.

```xml
<!-- The child node named "MyChildNode" -->
<button focus_next="@MyChildNode"/>
<!-- The grandchild node named "MyGrandChildNode" of "MyChildNode" -->
<button focus_next="@MyChildNode/MyGrandChildNode"/>
<!-- The current node -->
<button focus_next="@."/>
<!-- The parent node -->
<button focus_next="@.."/>
<!-- The root node -->
<button focus_next="@/root"/>
```

**Note:** The validity of the path is *not* checked.  This is because the resulting scene may use a `NodePath` that represents a node that is not available until runtime.

See: https://docs.godotengine.org/en/stable/classes/class_nodepath.html

### `Rect2`

`Rect2` attributes are either two two-element `Vector2` attributes separated by a comma `,`:

```xml
<control rect="(100,200),(32,32)"/>
```

or a single four-element tuple separated by a commas `,`:

```xml
<control rect="100,200,32,32"/>
```

**Note:** The bounds of the attribute are not checked.

### `ShortCut`

@TODO

### `Texture`

A `Texture` attribute should contain a full path, using the `res://` or other Godot-specific protocol, to a resource.

```xml
<texturebutton texture="res://icon.png"/>
```

**Note:** The existence of the resource is *not* checked.

### `Theme`

A `Theme` attribute should contain a full path, using the `res://` or other Godot-specific protocol, to a resource.

```xml
<button theme="res://my_theme.tres"/>
```

See: https://docs.godotengine.org/en/stable/classes/class_theme.html

**Note:** The existence of the resource is *not* checked.

### `Vector2`

`Vector2` attributes are a two-element tuple in parentheses `(` and `)` separated by a comma `,`:

```xml
<label position="(100,200)"/>
```

**Note:** The bounds of the attribute are not checked.

See: https://docs.godotengine.org/en/stable/classes/class_vector2.html