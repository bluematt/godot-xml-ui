class_name Convert
extends Node

# The character used to separate strings for PoolStringArray.
const POOL_STRING_ARRAY_SEPARATOR := "|"

const TYPE_MATERIAL := "Material"
const TYPE_TEXTURE := "Texture"
const TYPE_THEME := "Theme"
const TYPE_VIDEO_STREAM := "VideoStream"

static func xml_attr(xml_value:String, property_type):
	var converted_value

	match property_type:
		TYPE_NIL: converted_value = null
		TYPE_BOOL: converted_value = bool(xml_value)
		TYPE_INT: converted_value = int(xml_value)
		TYPE_REAL: converted_value = float(xml_value)
		TYPE_STRING: converted_value = str(xml_value)
		TYPE_VECTOR2: converted_value = xml_attr_to_vector2(xml_value)
		TYPE_RECT2: converted_value = xml_attr_to_rect2(xml_value)
		#
		TYPE_OBJECT: pass # We handle objects separately below depending on their actual
						 # (named) type.
		#
		TYPE_STRING_ARRAY: converted_value = xml_attr_to_poolstringarray(xml_value)
		# Named object types
		TYPE_MATERIAL: converted_value = load(str(xml_value))
		TYPE_TEXTURE: converted_value = load(str(xml_value))
		TYPE_THEME: converted_value = load(str(xml_value))
		TYPE_VIDEO_STREAM: converted_value = load(str(xml_value))
		_:
			printerr("Don't know what to do with value!", xml_value, property_type)
			converted_value = str(xml_value)

	return converted_value

# Convert an XML attribute to a Vector2.
# @TODO
static func xml_attr_to_vector2(xml_value:String):
	var regex = RegEx.new()
	regex.compile("\\((?<xcoord>[+-]?[0-9]+(\\.[0-9]+)?),\\s*(?<ycoord>[+-]?[0-9]+(\\.[0-9]+)?)\\)")
	var result = regex.search(xml_value)
	if result:
		return Vector2(float(result.get_string("xcoord")), float(result.get_string("ycoord")))

	return null

# Convert an XML attribute to a Rect2.
# @TODO
static func xml_attr_to_rect2(xml_value:String) -> Rect2:
	print(xml_value)
	var result := Rect2(Vector2.ZERO, Vector2.ZERO)
	return result

# Convert an XML attribute to a PoolStringArray.
# @TODO
static func xml_attr_to_poolstringarray(xml_value:String) -> PoolStringArray:
	print(xml_value)
	var result := PoolStringArray([])
	return result
