# Godot UI in XML

A simple GDScript for declaratively describing Godot UI controls in XML, and creating basic scenes for further customisation.

This might be a better way of getting a quick overview of a UI specification, rather than trying to work out what's happening in a node tree.

## Godot support

This is built around Godot 3.2.2.  YMMV.

## Supported controls

Only nodes based on `Control` are supported.

At present, not all `Control`s are currently supported, especially if they're used to define specific editor functionality.

## Supported properties

The basic property types (`int`, `float`, `bool`, `String`) and some `Resource` properties (e.g. `Texture`) are supported.

These are within the common build-in properties, which are mapped directly to XML attributes.

These are likely to change frequently and significantly.

## How to use

See the `examples`.

