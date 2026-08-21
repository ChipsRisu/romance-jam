extends DialogicBackground


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(2).timeout;
	$AnimationPlayer.play("cinematique");


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "cinematique":
		$AnimationPlayer.play("logo");
	if anim_name == "logo":
		$AnimationPlayer.play("texteContinue");
