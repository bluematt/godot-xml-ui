class_name Convert
extends Node

# The character used to separate strings for PoolStringArray.
const POOL_STRING_ARRAY_SEPARATOR := "|"

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
