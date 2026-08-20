extends Node

func _ready() -> void:
	SituationHandler.ui = $UI
	SituationHandler.container = $SituationContainer

func _on_toggle_movement_toggled(toggled_on: bool) -> void:
	SituationHandler.toggleMovement(toggled_on)
