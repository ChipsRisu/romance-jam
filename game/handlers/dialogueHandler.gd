extends Node

const PROLOGUE_TIMELINE = "prologue_1"
const EPILOGUE_TIMELINE = "epilogue_1"

func start(interaction: Interaction) -> void:
	var id = _workingId(interaction)
	interaction.checked = true
	_start(id)

func start_prologue() -> void:
	_start(PROLOGUE_TIMELINE)

func start_epilogue() -> void:
	_start(EPILOGUE_TIMELINE)

func _workingId(interaction: Interaction) -> String:
	if interaction.ignoreDayForDialogue:
		return "%s_%s" % [interaction.key, GameHandler.state.situation]
	return "%s_%s_%s" % [interaction.key, GameHandler.state.situation, GameHandler.state.day]

func _start(timeline: String) -> void:
	# For Dev purpose only
	print("TIMELINE TRIGGERED > ", timeline)
	
	if Dialogic.timeline_exists(timeline):
		Dialogic.start(timeline)
	else:
		printerr("Not found: ", timeline)
