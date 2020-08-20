# Meta

@TODO Describe the additional functionality offered below.

## Constants

> *Not yet implemented*

Constants can be defined using the `const` element so that attribute values can be re-used.

```xml
<const name="MyBackgroundColor" value="#666666"/>
<button color="{{MyBackgroundColor}}"/>
<panel color="{{MyBackgroundColor}}"/>
```

Arrays can also be created and using in [loops](#Loops).

```xml
<const name="ButtonNames" value="[Publish,Edit,Delete]"/>
```

## Loops

Loops allow for multiple elements to be created in series.

> *Not yet implemented*

```xml
<loop times="3">
    <button name="Button{{.index}}"/>
</loop>
```

generates:

```xml
<button name="Button0"/>
<button name="Button1"/>
<button name="Button2"/>
```

### Looping over arrays

> *Not yet implemented*

```xml
<loop with="[Publish,Edit,Delete]">
    <button name="Button{{.index}}" text="{{.value}}"/>
</loop>
```

generates:

```xml
<button name="Button0" text="Publish"/>
<button name="Button1" text="Edit"/>
<button name="Button2" text="Delete"/>
```

## Resources

> *Not yet implemented*

Some `Resources` can be created inline:

* `ButtonGroup` via `<buttongroup/>`
* `ShortCut` via `<shortcut/>`

## Signals

> *Not yet implemented*

@TODO