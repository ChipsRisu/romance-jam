class_name ClickableButton
extends TextureButton

@export var tag: String
@export var dayPresenceList: Array[Situation.Day]
@export var ignoreDay: bool = true

##Si coché n'est visible que 1 fois. Disparait après avoir était cliqué
@export var playOne: bool = false;

func isAlredyPlayed() -> bool:
	if not playOne: return false;
	return GameHandler.hasPlayOnce(_getFormatedPathKey());

func setChecked(state: bool) -> void:
	GameHandler.setPlayOnce(_getFormatedPathKey());
	visible = false;

func _getFormatedPathKey() -> String:
	return str(self.get_path().get_concatenated_names(), GameHandler.state.day);

## Either has no tag or has matching tag
func match_tag(_tag: String) -> bool:
	return tag == null || tag.is_empty() || tag == _tag

## Either ignore the day or check if should be present today
func is_present_today() -> bool:
	var today = GameHandler.state.day
	return self.ignoreDay || self.dayPresenceList.has(today)

## Called on clicked, to override if needed
func on_clicked_custom() -> void:
	pass
