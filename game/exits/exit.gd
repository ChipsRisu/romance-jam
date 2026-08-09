class_name Exit
extends TextureButton

const BLINK_TIME = 1.5

@export var current: Situation.Key
@export var target: Situation.Key

signal triggered(target: Situation.Key)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(_onPressed)
	_blinkEffect()

func _onPressed() -> void:
	triggered.emit(target)

func _blinkEffect() -> void:
	var tween = create_tween().set_loops()
	tween.tween_property(self, "modulate:a", 0.2, BLINK_TIME)
	tween.tween_property(self, "modulate:a", 1.0, BLINK_TIME)
