extends Node

func start(interaction: Interaction) -> void:
	# TODO maybe some logic here ? 
	# Or else we can just skip this handler and use Dialogic directly, since it's already a Singleton itself !
	print("INTERACTION TRIGGERED > ", interaction.key)
	
	interaction.checked = true
	Dialogic.start(interaction.key)
