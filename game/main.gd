extends Node

func _ready() -> void:
	SituationHandler.ui = $UI
	SituationHandler.container = $SituationContainer
	
	# TODO do this better later
	GameHandler.start()

func _on_toggle_movement_toggled(toggled_on: bool) -> void:
	SituationHandler.toggleMovement(toggled_on)

func _on_day_selector_item_selected(index: int) -> void:
	DayHandler.setDay(index)
