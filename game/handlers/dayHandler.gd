extends Node

func setDay(day: Situation.Day) -> void:
	print("CHANGE DAY ", day)
	GameHandler.state.day = day
	
func next() -> Situation.Day:
	var day = GameHandler.state.day
	if day == Situation.Day.TUE:
		get_tree().change_scene_to_file("res://game/EndDemo.tscn");
	elif Situation.Day.SUN != day:
		setDay(day + 1)
		DialogueHandler.start_day_description()
	else:
		DialogueHandler.start_epilogue()
	
	return GameHandler.state.day
