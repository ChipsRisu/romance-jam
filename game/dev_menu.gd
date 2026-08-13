extends Control

@onready var situationSelector: OptionButton = $Panel/DevData/SituationSelector;
@onready var daySelector: OptionButton = $Panel/DevData/DaySelector;

func _ready() -> void:
	for key in Situation.Key.keys():
		situationSelector.add_item(key, Situation.Key[key])
	for day in Situation.Day.keys():
		daySelector.add_item(day, Situation.Day[day])

func _on_situation_selector_item_selected(index: int) -> void:
	SituationHandler.loadSituation(Situation.Key.VOID, situationSelector.get_selected_id())
