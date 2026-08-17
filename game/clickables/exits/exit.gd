@icon("res://icons/exit.svg")
class_name Exit
extends TaggedButton

const BLINK_PROPERTY = "modulate:a"
const BLINK_TIME = 1.5

@export var target: Situation.Key

func _ready() -> void:
	_blinkEffect()

func _blinkEffect() -> void:
	var blink = create_tween().set_loops()
	blink.tween_property(self, BLINK_PROPERTY, 0.2, BLINK_TIME)
	blink.tween_property(self, BLINK_PROPERTY, 1.0, BLINK_TIME)
