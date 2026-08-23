extends Node2D

var timeTravers: float = 4;
var toRight: bool = true
var cibleOnCrossair: bool = false;
var canShoot: bool;
var gameIsFinish: bool;
var life: int = 3;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_animateCible()


func _input(event) -> void:
	if gameIsFinish or not cibleOnCrossair or not canShoot:
		return;
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		print("BANG")
		$AnimationPlayer.play("bang");
		canShoot = false;
		timeTravers -= 1;
		life -= 1;
		if life == 0:
			GameIsWin();


func GameIsWin() -> void:
	gameIsFinish = true;
	print("Stand de tire terminé");
	#$AnimationPlayer.play("finishGame");
	#await $AnimationPlayer.animation_finished;
	#TODO faire la suite pour sortire du minijeu. Pas oublié de queue free le jeu ou le rendre visible false;


func _animateCible() -> void:
	if gameIsFinish: return;
	canShoot = true;
	
	var tween: Tween = create_tween();
	tween.set_ease(Tween.EASE_IN_OUT);
	tween.set_trans(Tween.TRANS_QUAD);
	tween.finished.connect(_animateCible);
	
	tween.tween_property($Path2D/PathFollow2D, "progress_ratio", 1 if toRight else 0, timeTravers);
	
	toRight = not toRight;


func _on_area_2d_area_entered(area: Area2D) -> void:
	cibleOnCrossair = true;


func _on_area_2d_area_exited(area: Area2D) -> void:
	cibleOnCrossair = false;
