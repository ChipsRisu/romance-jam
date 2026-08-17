extends Control

@onready var situationSelector: OptionButton = $Panel/VBoxContainer/SituationHBox/SituationSelector;
@onready var daySelector: OptionButton = $Panel/VBoxContainer/DaysHBox/DaySelector;
@onready var tagSituationSelector: OptionButton = $Panel/VBoxContainer/TagsHBox/TagSelector

var selectedTagSituation: Situation.Key;
var selectedTag: String = "";

func _ready() -> void:
	for key in Situation.Key.keys():
		situationSelector.add_item(key, Situation.Key[key])
		tagSituationSelector.add_item(key, Situation.Key[key])
	for day in Situation.Day.keys():
		daySelector.add_item(day, Situation.Day[day])

func _on_situation_selector_item_selected(index: int) -> void:
	SituationHandler.loadSituation(situationSelector.get_selected_id())

func _on_day_selector_item_selected(index: int) -> void:
	DayHandler.setDay(index)
	SituationHandler.reloadSituation()

func _on_tag_selector_item_selected(index: int) -> void:
	selectedTagSituation = tagSituationSelector.get_selected_id();
	changeTag();

func _on_line_edit_text_changed(new_text: String) -> void:
	selectedTag = new_text;
	changeTag();

func changeTag() -> void:
	if selectedTag.is_empty():
		GameHandler.state.tags.erase(selectedTagSituation);
	else :
		GameHandler.state.tags.set(selectedTagSituation, selectedTag);
	print("Liste des tags : ", GameHandler.state.tags)
	

func _on_mini_game_selector_item_selected(index: int) -> void:
	for game in $"../../MiniGames".get_children():
		game.visible = false;
	
	match index:
		1:
			$"../../MiniGames/Taquin".visible = true;
