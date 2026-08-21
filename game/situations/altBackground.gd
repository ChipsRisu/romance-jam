class_name AltBackground
extends Sprite2D

@export var tag: String

func match_tag(_tag: String) -> bool:
	return  tag != null && not _tag.is_empty() && _tag == tag
