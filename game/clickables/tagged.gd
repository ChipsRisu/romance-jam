class_name TaggedButton
extends TextureButton

@export var tag: Variant

## Either has no tag or has matching tag
func match_tag(_tag: Variant) -> bool:
	return tag == null || tag == _tag
