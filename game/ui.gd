class_name UI
extends CanvasLayer

@onready var movementButton: TextureButton = $HUD/toggleMovement

func resetHud() -> void:
	movementButton.button_pressed = false

# TODO handle loading screen here ?
