extends Node

var state: GameState

## Start new game
func start() -> void:
	state = GameState.new()
	_setup()
	
	DialogueHandler.start_prologue()

func load_save() -> void:
	state = GameState.new() # TODO should be fetch from file
	_setup()
	
# TODO should save state to file
func save() -> void:
	pass

func _setup() -> void:
	DayHandler.setDay(state.day)
	SituationHandler.loadSituation(state.situation)

func getActiveTag() -> String: 
	print(state.situation)
	return str(state.tags.get(state.situation)) if state.situation != null || Situation.Key.VOID == state.situation else ""
