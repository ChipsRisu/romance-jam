extends Node2D

var gameIsFinish: bool = false;

var minXPos: float;
var maxXPos: float;
var minYPos: float;
var maxYPos: float;

@onready var toileScene: PackedScene = preload("res://game/mini-games/GrenierNettoyage/toile.tscn");

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var viewportSize = get_viewport_rect().size;
	minXPos = 100;
	maxXPos = viewportSize.x-100;
	minYPos = 100;
	maxYPos = viewportSize.y-100;
	for toile in $toiles.get_children():
		toile.tree_exited.connect(_detectIfWin);
		toile.position = _getRandomPos()

func GameIsWin() -> void:
	gameIsFinish = true;
	print("Grenier nétoyer");
	$AnimationPlayer.play("finishGame");
	await $AnimationPlayer.animation_finished;
	#TODO faire la suite pour sortire du minijeu. Pas oublié de queue free le jeu ou le rendre visible false;

#region internal methods
func _detectIfWin() -> void:
	if $toiles.get_child_count() > 0: return;
	GameIsWin();
	
func _spawnToile() -> void:
	var newToile: Area2D = toileScene.instantiate();
	newToile.position = _getRandomPos();
	newToile.tree_exited.connect(_detectIfWin);
	$toiles.add_child(newToile);

func _getRandomPos() -> Vector2:
	return Vector2(randi_range(minXPos, maxXPos),randi_range(minYPos, maxYPos));
#endregion

func _on_timer_timeout() -> void:
	if gameIsFinish: return;
	_spawnToile();
	$Timer.start(randf_range(2, 4));
