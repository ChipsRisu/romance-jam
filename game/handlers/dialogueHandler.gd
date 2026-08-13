extends Node

func start(interaction: Interaction) -> void:
	# TODO maybe some logic here ? 
	# Or else we can just skip this handler and use Dialogic directly, since it's already a Singleton itself !
	var id = workingId(interaction)
	interaction.checked = true
	
	# For Dev purpose only
	print("INTERACTION TRIGGERED > ", id)
	
	if Dialogic.timeline_exists(id):
		Dialogic.start(id)

func workingId(interaction: Interaction) -> String:
	if interaction.ignoreDayForDialogue:
		return "%s_%s" % [interaction.key, GameHandler.state.situation]
	return "%s_%s_%s" % [interaction.key, GameHandler.state.situation, GameHandler.state.day]
