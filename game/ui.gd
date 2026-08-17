class_name UI
extends CanvasLayer

@onready var movementButton: TextureButton = $HUD/toggleMovement

func _ready() -> void:
	Dialogic.timeline_started.connect(_movementVisibility.bind(false))
	Dialogic.timeline_ended.connect(_movementVisibility.bind(true))

func resetHud() -> void:
	movementButton.button_pressed = false

# TODO handle loading screen here ?

func _movementVisibility(value: bool) -> void:
	movementButton.visible = value
