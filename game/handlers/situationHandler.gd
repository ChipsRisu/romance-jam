extends Node

var container: Node = null

# TODO there should be a void situation
const SITUATION_PATH_DICTIONARY := {
	Situation.Key.VOID: "",				# TODO should be a special scene
	Situation.Key.HOUSE_FRONT: "",		# NOT IMPLEMENTED
	Situation.Key.HOUSE_ENTRANCE: "", 	# NOT IMPLEMENTED
	Situation.Key.HOUSE_CORRIDOR: "", 	# NOT IMPLEMENTED
	Situation.Key.HOUSE_LIVINGROOM: 	"res://game/situations/house/livingroom/livingroom.tscn",
	Situation.Key.HOUSE_KITCHEN: 		"res://game/situations/house/kitchen/kitchen.tscn",
	Situation.Key.HOUSE_BEDROOM: "", 	# NOT IMPLEMENTED
	Situation.Key.HOUSE_ATTIC: "", 		# NOT IMPLEMENTED
	Situation.Key.VILLAGE_PLACE: "", 	# NOT IMPLEMENTED
	Situation.Key.SEASIDE_BEACH: "", 	# NOT IMPLEMENTED
	Situation.Key.SEASIDE_COVE: "", 	# NOT IMPLEMENTED
	Situation.Key.FOREST_CLEARING: "", 	# NOT IMPLEMENTED
	Situation.Key.FOREST_SHACK: "", 	# NOT IMPLEMENTED
	Situation.Key.CAVE: "", 			# NOT IMPLEMENTED
}

func loadSituation(from: Situation.Key, to: Situation.Key) -> void: 
	var situationPath = SITUATION_PATH_DICTIONARY[to]
	
	# TODO only for dev
	print("LOAD SITUATION FROM ", from, " TO ", to, " > ", situationPath)
	
	# Prevent NPE (should happen only during dev)
	if (container == null 
		|| situationPath.is_empty() 
		|| !ResourceLoader.exists(situationPath)): 
		return;
	
	# TODO start loading screen here
	
	# Remove all children
	for child in container.get_children():
		container.remove_child(child)
		child.queue_free()
	
	# Load new Situation
	var situation = load(situationPath)
	container.add_child(situation.instantiate())
	
	# TODO close loading screen
