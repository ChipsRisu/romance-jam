extends Node

const PROLOGUE_TIMELINE = "prologue_1"
const EPILOGUE_TIMELINE = "epilogue_1"

func start(interaction: Interaction) -> void:
	interaction.checked = true
	if interaction.ignoreDay: _start("%s_%s" % [interaction.key, GameHandler.state.situation])
	else: _start("%s_%s_%s" % [interaction.key, GameHandler.state.situation, GameHandler.state.day])

func start_prologue() -> void:
	_start(PROLOGUE_TIMELINE)

func start_epilogue() -> void:
	_start(EPILOGUE_TIMELINE)

func start_situation_description(ignoreDay: bool = true) -> void:
	if ignoreDay: _start("situation_%s" % [GameHandler.state.situation])
	else: _start("situation_%s_%s" % [GameHandler.state.situation, GameHandler.state.day])

func _start(timeline: String) -> void:
	# For Dev purpose only
	print("TIMELINE TRIGGERED > ", timeline)
	
	if Dialogic.timeline_exists(timeline):
		Dialogic.start(timeline)
	else:
		printerr("Not found: ", timeline)
