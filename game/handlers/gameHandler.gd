extends Node

const SITUATION_CHECK_KEY = "SIT"

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
	
	## TODO dev mode only
	Dialogic.VAR.set_variable("skipIntro", true);

func getTag(situation: Situation.Key) -> String:
	return str(state.tags.get(situation)) if _isValidSituation(situation) else ""

func setTag(situation: Situation.Key, tag: String) -> void:
	if _isValidSituation(situation):
		state.tags.set(situation, tag)

func getActiveTag() -> String: 
	return getTag(state.situation)

func setActiveTag(tag: String) -> void:
	setTag(state.situation, tag)

func hasVisitedSituation(situation: Situation.Key, ignoreDay: bool = true) -> bool:
	if _isValidSituation(situation):
		if ignoreDay: 
			return state.situationVisited.has(situation)
		else:
			var value = state.situationVisited.get(situation);
			return state.situationVisited.has(situation) && value >= state.day
	else:
		return false

func hasVisitedSituationToday(situation: Situation.Key) -> bool:
	return hasVisitedSituation(situation, false)

func visitSituation(situation: Situation.Key) -> void:
	if _isValidSituation(situation):
		state.situationVisited.set(situation, state.day);

func _isValidSituation(situation: Situation.Key = state.situation) -> bool:
	return situation != null && Situation.Key.VOID != situation
