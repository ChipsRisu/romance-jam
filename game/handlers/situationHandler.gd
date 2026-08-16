extends Node

var ui: UI = null
var container: Node = null

var activeSituation: Situation = null

# TODO there should be a void situation
const SITUATION_PATH_DICTIONARY := {
	Situation.Key.VOID: "",				# TODO should be a special scene
	Situation.Key.HOUSE_FRONT: 			"res://game/situations/outside/house/house.tscn",
	Situation.Key.HOUSE_ENTRANCE: 		"res://game/situations/house/entrance/entrance.tscn",
	#Situation.Key.HOUSE_CORRIDOR: 		"res://game/situations/house/corridor/corridor.tscn",
	Situation.Key.HOUSE_LIVINGROOM: 	"res://game/situations/house/livingroom/livingroom.tscn",
	Situation.Key.HOUSE_KITCHEN: 		"res://game/situations/house/kitchen/kitchen.tscn",
	Situation.Key.HOUSE_BEDROOM: 		"res://game/situations/house/bedroom/bedroom.tscn",
	Situation.Key.HOUSE_ATTIC: 			"res://game/situations/house/attic/attic.tscn",
	Situation.Key.VILLAGE_PLACE: 		"res://game/situations/outside/village/village.tscn",
	Situation.Key.SEASIDE_BEACH: 		"res://game/situations/outside/beach/beach.tscn",
	Situation.Key.SEASIDE_COVE: 		"res://game/situations/outside/cove/cove.tscn",
	Situation.Key.FOREST_CLEARING: 		"res://game/situations/outside/forest/forest.tscn",
	Situation.Key.FOREST_SHACK: 		"res://game/situations/outside/shack/shack.tscn",
	Situation.Key.CAVE: 				"res://game/situations/outside/cave/cave.tscn",
}

func loadSituation(from: Situation.Key, to: Situation.Key) -> void: 
	var situationPath = SITUATION_PATH_DICTIONARY[to]
	
	# only for dev purpose
	print("LOAD SITUATION FROM ", from, " TO ", to, " > ", situationPath)
	
	# Prevent NPE (should happen only during dev)
	if (container == null 
		|| situationPath.is_empty() 
		|| !ResourceLoader.exists(situationPath)): 
		return;
	
	# TODO start loading screen here
	
	# Set the scene
	_clean()
	_load(to)
	_resetHud()
	
	# Update the game state
	GameHandler.state.situation = to
	
	# TODO close loading screen

func reloadSituation() -> void:
	var situation = GameHandler.state.situation
	var situationPath = SITUATION_PATH_DICTIONARY[situation]
	
	# only for dev purpose
	print("RELOAD SITUATION ", situation)
	
	# Set the scene
	_clean()
	_load(situation)
	_resetHud()

func toggleMovement(value: bool) -> void:
	if activeSituation != null:
		activeSituation.updateUi(value)

func _load(to: Situation.Key) -> void:
	if Situation.Key.VOID == to:
		return
	
	var situation = load(SITUATION_PATH_DICTIONARY[to])
	activeSituation = situation.instantiate()
	container.add_child(activeSituation)
	
func _clean() -> void:
	activeSituation = null
	for child in container.get_children():
		container.remove_child(child)
		child.queue_free()

func _resetHud() -> void:
	toggleMovement(false)
	ui.resetHud()
