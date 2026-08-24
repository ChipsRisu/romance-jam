extends Node

var arrorCursor = load("res://assets/UI/cursor 1-little.png");
var pointerCursor = load("res://assets/UI/cursor 2-little.png");

func _ready() -> void:
	Input.set_custom_mouse_cursor(arrorCursor,  Input.CURSOR_ARROW);
	Input.set_custom_mouse_cursor(pointerCursor, Input.CURSOR_POINTING_HAND);
	
	SituationHandler.ui = $UI
	SituationHandler.container = $SituationContainer

func _on_toggle_movement_toggled(toggled_on: bool) -> void:
	SituationHandler.toggleMovement(toggled_on)

func _on_audio_stream_player_finished() -> void:
	$AudioStreamPlayer.play()
