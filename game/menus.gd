extends CanvasLayer

func _on_start_game_button_pressed() -> void:
	$StartMenu.visible = false;
	GameHandler.start()

func _on_load_game_button_pressed() -> void:
	$StartMenu.visible = false;
	GameHandler.load_save()

func _on_dev_mode_check_button_toggled(toggled_on: bool) -> void:
	$"../UI/DEV MENU".visible = toggled_on;
