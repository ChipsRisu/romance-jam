extends Node

func _ready() -> void:
	SituationHandler.container = $SituationContainer
	
	# TODO do this better later
	SituationHandler.loadSituation(Situation.Key.VOID, Situation.Key.HOUSE_KITCHEN)
