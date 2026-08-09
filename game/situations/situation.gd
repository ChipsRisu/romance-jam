class_name Situation
extends Node2D

enum Key {
	HOUSE_FRONT,
	HOUSE_ENTRANCE,
	HOUSE_CORRIDOR,
	HOUSE_LIVINGROOM,
	HOUSE_KITCHEN,
	HOUSE_BEDROOM,
	HOUSE_ATTIC,
	VILLAGE_PLACE,
	SEASIDE_BEACH,
	SEASIDE_COVE,
	FOREST_CLEARING,
	FOREST_SHACK,
	CAVE
}

@onready var interactions = $Interactions
@onready var exits = $Exits

@export var currentSituation: Situation.Key

signal do_exit(current: Situation.Key, target: Situation.Key)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_handle_exit()

func _handle_exit() -> void:
	var action = func (target: Situation.Key):
		do_exit.emit(currentSituation, target)
	
	for exit: Exit in exits.get_children():
		exit.triggered.connect(action)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
