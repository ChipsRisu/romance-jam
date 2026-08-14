@icon("res://icons/situation.svg")
class_name Situation
extends Node2D

# IMPORTANT: changing a number means changing ALL related target in Situations
# Please handle this with care
enum Key {
	VOID 				= 0,
	HOUSE_FRONT 		= 100,
	HOUSE_ENTRANCE 		= 101,
	HOUSE_CORRIDOR 		= 102,
	HOUSE_LIVINGROOM 	= 103,
	HOUSE_KITCHEN 		= 104,
	HOUSE_BEDROOM 		= 105,
	HOUSE_ATTIC 		= 106,
	VILLAGE_PLACE 		= 200,
	SEASIDE_BEACH 		= 300,
	SEASIDE_COVE 		= 301,
	FOREST_CLEARING 	= 400,
	FOREST_SHACK 		= 401,
	CAVE 				= 500
}

enum Day {
	ALL = 0,
	MON = 1,
	TUE = 2,
	WEN = 3,
	THU = 4,
	FRI = 5,
	SAT = 6,
	SUN = 7,
}

@onready var exits = $Exits
@onready var interactions = $Interactions

@export var currentSituation: Situation.Key

func _ready() -> void:
	_handle_interactions()
	_handle_exits()

func _handle_exits() -> void:
	for exit: Exit in exits.get_children():
		exit.pressed.connect(func(): SituationHandler.loadSituation(currentSituation, exit.target))

func _handle_interactions() -> void:
	for interaction: Interaction in interactions.get_children():
		if interaction.dayAbsenceList.has(GameHandler.state.day):
			interaction.hide()
		else: 
			interaction.pressed.connect(func(): DialogueHandler.start(interaction))

func updateUi(isMoving: bool) -> void:
	if isMoving: exits.show() 
	else: exits.hide()
	for interaction: Interaction in interactions.get_children():
		interaction.disabled = isMoving
