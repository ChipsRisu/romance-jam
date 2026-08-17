extends Control

@onready var situationSelector: OptionButton = $Panel/DevData/SituationSelector;
@onready var daySelector: OptionButton = $Panel/DevData/DaySelector;

func _ready() -> void:
	for key in Situation.Key.keys():
		situationSelector.add_item(key, Situation.Key[key])
	for day in Situation.Day.keys():
		daySelector.add_item(day, Situation.Day[day])

func _on_situation_selector_item_selected(index: int) -> void:
	SituationHandler.loadSituation(situationSelector.get_selected_id())

func _on_day_selector_item_selected(index: int) -> void:
	DayHandler.setDay(index)
	SituationHandler.reloadSituation()


func _on_mini_game_selector_item_selected(index: int) -> void:
	for game in $"../../MiniGames".get_children():
		game.visible = false;
	
	match index:
		1:
			$"../../MiniGames/Taquin".visible = true;
