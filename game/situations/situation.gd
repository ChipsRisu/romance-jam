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

@onready var interactions = $Interactions
@onready var exits = $Exits

@export var currentSituation: Situation.Key

func _ready() -> void:
	_handle_exits()

func _handle_exits() -> void:
	for exit: Exit in exits.get_children():
		exit.button_up.connect(func(): SituationHandler.loadSituation(currentSituation, exit.target))
