class_name TaggedButton
extends TextureButton

@export var tag: String

## Either has no tag or has matching tag
func match_tag(_tag: String) -> bool:
	return tag == null || tag.is_empty() || tag == _tag
