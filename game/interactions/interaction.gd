@icon("res://icons/interaction.svg")
class_name Interaction
extends TextureButton

@export var key: String
@export var dayAbsenceList: Array[Situation.Day]
@export var ignoreDayForDialogue: bool
var checked: bool
