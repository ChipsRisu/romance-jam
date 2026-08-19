extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_game_button_pressed() -> void:
	$StartMenu.visible = false;
	Dialogic.start("prologue_1");


func _on_load_game_button_pressed() -> void:
	pass # Replace with function body.


func _on_dev_mode_check_button_toggled(toggled_on: bool) -> void:
	$"../UI/DEV MENU".visible = toggled_on;
