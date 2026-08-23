extends Node

var ui: UI = null
var container: Node = null

var activeSituation: Situation = null

# TODO there should be a void situation
const SITUATION_PATH_DICTIONARY := {
	Situation.Key.VOID: "",				# Special scene
	Situation.Key.HOUSE_FRONT: 			"res://game/situations/outside/house/house.tscn",
	Situation.Key.HOUSE_ENTRANCE: 		"res://game/situations/house/entrance/entrance.tscn",
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

## Charge une nouvelle situation
func loadSituation(to: Situation.Key) -> void: 
	var from: Situation.Key = GameHandler.state.situation if GameHandler.state.situation else Situation.Key.VOID
	
	var situationPath = SITUATION_PATH_DICTIONARY[to]
	
	# only for dev purpose
	print("LOAD SITUATION FROM ", from, " TO ", to, " > ", situationPath)
	
	# Prevent NPE (should happen only during dev)
	if (container == null 
		|| situationPath.is_empty() 
		|| !ResourceLoader.exists(situationPath)): 
		print("COULD NOT FIND ", to)
		to = Situation.Key.VOID
	
	# TODO start loading screen here
	
	# Set the scene
	_clean()
	_load(to)
	_resetHud()
	
	# Update the game state
	GameHandler.state.situation = to
	
	# TODO close loading screen
	
	_triggerSituationDialogue(to)
	GameHandler.visitSituation(to)

## Recharge la Situation actuelle et effectue les change
func reloadSituation() -> void:
	var situation = GameHandler.state.situation
	var situationPath = SITUATION_PATH_DICTIONARY[situation]
	
	# only for dev purpose
	print("RELOAD SITUATION ", situation)
	
	# Set the scene
	_clean()
	_load(situation)
	_resetHud()

func loadVoid() -> void:
	loadSituation(Situation.Key.VOID)

## Active le HUD de déplacement et bloque les interactions
func toggleMovement(value: bool) -> void:
	if activeSituation != null:
		activeSituation.updateUi(value)

func _load(to: Situation.Key) -> void:
	# Updates current situtation state
	GameHandler.state.situation = to
	
	if !Situation.Key.VOID == to:
		# Instantiate the scene
		var situation = load(SITUATION_PATH_DICTIONARY[to])
		activeSituation = situation.instantiate()
		container.add_child(activeSituation)

func _clean() -> void:
	activeSituation = null
	for child in container.get_children():
		container.remove_child(child)
		child.queue_free()

# TODO below could be moved to an UI handler ?

func _resetHud() -> void:
	toggleMovement(false)
	ui.resetHud()

func hideHud(value: bool) -> void:
	ui.movementVisibility(!value)

func _triggerSituationDialogue(to: Situation.Key) -> void:
	if !GameHandler.hasVisitedSituation(to):
		DialogueHandler.start_situation_description(true)
	elif !GameHandler.hasVisitedSituationToday(to):
		DialogueHandler.start_situation_description(false)
