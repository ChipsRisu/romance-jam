@icon("res://icons/interaction.svg")
class_name Interaction
extends TaggedButton

@export var key: String
@export var dayAbsenceList: Array[Situation.Day]
@export var ignoreDayForDialogue: bool
var checked: bool

func is_present_today() -> bool:
	var today = GameHandler.state.day
	return self.ignoreDayForDialogue || !self.dayAbsenceList.has(today)
