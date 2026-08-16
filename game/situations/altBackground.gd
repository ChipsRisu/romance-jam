class_name AltBackground
extends Sprite2D

@export var tag: Variant

func match_tag(_tag: Variant) -> bool:
	print (_tag, "===", tag)
	return _tag != null && _tag == tag
