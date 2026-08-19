extends Node

func setDay(day: Situation.Day) -> void:
	print("CHANGE DAY ", day)
	GameHandler.state.day = day
	
func next() -> Situation.Day:
	var day = GameHandler.state.day
	if Situation.Day.SUN != day:
		setDay(day + 1)
	
	return GameHandler.state.day
