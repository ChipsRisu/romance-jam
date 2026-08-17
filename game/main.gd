extends Node

func _ready() -> void:
	SituationHandler.ui = $UI
	SituationHandler.container = $SituationContainer
	
	# TODO do this better later
	GameHandler.start()
	
	## TEST CODE HERE
	GameHandler.state.tags.set(Situation.Key.HOUSE_ENTRANCE, "test")
	Dialogic.start("prologue_1")
	# INFO dans entrance 1 exit et 2 background en test avec "test" et "aa"
	##

func _on_toggle_movement_toggled(toggled_on: bool) -> void:
	# DEV purpose only
	#print("MOVEMENT ", toggled_on)
	SituationHandler.toggleMovement(toggled_on)
