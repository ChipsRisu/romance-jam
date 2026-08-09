class_name SituationHandler
extends Node

const SITUATION_PATH_DICTIONARY := {
	Situation.Key.HOUSE_FRONT: "",		# NOT IMPLEMENTED
	Situation.Key.HOUSE_ENTRANCE: "", 	# NOT IMPLEMENTED
	Situation.Key.HOUSE_CORRIDOR: "", 	# NOT IMPLEMENTED
	Situation.Key.HOUSE_LIVINGROOM: "res://game/situations/house/livingroom/livingroom.tscn",
	Situation.Key.HOUSE_KITCHEN: "res://game/situations/house/kitchen/kitchen.tscn",
	Situation.Key.HOUSE_BEDROOM: "", 	# NOT IMPLEMENTED
	Situation.Key.HOUSE_ATTIC: "", 		# NOT IMPLEMENTED
	Situation.Key.VILLAGE_PLACE: "", 	# NOT IMPLEMENTED
	Situation.Key.SEASIDE_BEACH: "", 	# NOT IMPLEMENTED
	Situation.Key.SEASIDE_COVE: "", 		# NOT IMPLEMENTED
	Situation.Key.FOREST_CLEARING: "", 	# NOT IMPLEMENTED
	Situation.Key.FOREST_SHACK: "", 		# NOT IMPLEMENTED
	Situation.Key.CAVE: "", 				# NOT IMPLEMENTED
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	child_entered_tree.connect(connectChildrenSignals)
	_loadSituation(0, Situation.Key.HOUSE_KITCHEN)

# TODO this seems shitty, there should be a better way to hand event ?
func connectChildrenSignals(node: Node) -> void :
	if node.has_signal("exit"):
		node.exit.connect(_loadSituation)
		
	for child in node.get_children():
		connectChildrenSignals(child)

func _loadSituation(from: Situation.Key, to: Situation.Key) -> void: 
	var situationPath = SITUATION_PATH_DICTIONARY[to]
	
	if situationPath.is_empty() || !ResourceLoader.exists(situationPath): return;
	print("LOAD SITUATION FROM ", from, " TO ", to, " > ", situationPath)
	
	# TODO start loading screen here
	# Remove all children
	for child in get_children():
		remove_child(child)
		child.queue_free()
	
	# Load new Situation
	var situation = load(situationPath)
	add_child(situation.instantiate())
	# TODO close loading screen
	
	
