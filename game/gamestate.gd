class_name GameState

var situation: Situation.Key
var day: Situation.Day
var checks: Dictionary
var inventory: Dictionary
var tags: Dictionary

func _init() -> void:
	self.situation = Situation.Key.VOID
	self.day = Situation.Day.MON
