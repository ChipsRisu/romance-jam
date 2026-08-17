extends Node

var state: GameState

func start() -> void:
	state = GameState.new()
	# TODO prepare something ?
	_setup()
	
# TODO should be fetch from file
func load() -> void:
	state = GameState.new()
	_setup()
	
# TODO should save state to file
func save() -> void:
	pass

func _setup() -> void:
	DayHandler.setDay(state.day)
	SituationHandler.loadSituation(state.situation)

func getActiveTag() -> Variant:
	print(state.situation)
	return state.tags.get(state.situation) if state.situation != null || Situation.Key.VOID == state.situation else null
