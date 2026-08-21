@icon("res://icons/interaction.svg")
class_name Interaction
extends ClickableButton

enum ClickableType {
	ITM = 0,
	NPC = 1
}

@export var key: String
@export var type: ClickableType = ClickableType.ITM
var checked: bool
