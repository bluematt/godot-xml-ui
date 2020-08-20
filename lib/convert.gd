class_name Convert
extends Node

# The character used to separate strings for PoolStringArray.
const POOL_STRING_ARRAY_SEPARATOR := "|"

const VECTOR_START := "("
const VECTOR_END := ")"
const VECTOR_SEPARATOR := ","

# Convert an XML attribute to a Vector2.
# @TODO
static func xml_attr_to_vector2(xml_value:String) -> Vector2:
	print(xml_value)
	return Vector2.ZERO

# Convert an XML attribute to a Rect2.
# @TODO
static func xml_attr_to_rect2(xml_value:String) -> Rect2:
	print(xml_value)
	return Rect2(Vector2.ZERO, Vector2.ZERO)

# Convert an XML attribute to a PoolStringArray.
# @TODO
static func xml_attr_to_poolstringarray(xml_value:String) -> PoolStringArray:
	print(xml_value)
	return PoolStringArray([])
