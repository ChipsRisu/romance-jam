extends Node

func _ready() -> void:
	SituationHandler.ui = $UI
	SituationHandler.container = $SituationContainer
	
	# TODO do this better later
	SituationHandler.loadSituation(Situation.Key.VOID, Situation.Key.HOUSE_KITCHEN)

func _on_toggle_movement_toggled(toggled_on: bool) -> void:
	SituationHandler.toggleMovement(toggled_on)
