extends Area2D

var life: int = 3;
var tween:Tween;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rotation_degrees = randf_range(0,360);
	$AnimationPlayer.play("spawn");

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		life -= 1;
		if life == 0:
			queue_free();
		else:
			_animHit();

func _animHit() -> void:
	if tween:tween.kill();

	tween = create_tween();
	tween.set_ease(Tween.EASE_OUT);
	tween.set_trans(Tween.TRANS_ELASTIC);
	tween.set_parallel(true);

	tween.tween_property(self,"scale", scale*0.9 , 0.5);
