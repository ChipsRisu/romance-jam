extends Node

enum MiniGame {
	GRENIER = 0,
	TAQUIN = 1,
};

var nodeMiniGame: CanvasLayer;

@onready var grenierScene: PackedScene = preload("res://game/mini-games/GrenierNettoyage/GrenierNettoyage.tscn");
@onready var taquinScene: PackedScene = preload("res://game/mini-games/Taquin/taquin.tscn");


func startMiniGame(game: MiniGame) -> Node2D:
	get_tree().current_scene.find_child("MiniGames");
	if nodeMiniGame == null : nodeMiniGame = get_tree().current_scene.find_child("MiniGames");
	match game:
		MiniGame.GRENIER:
			return _createMiniGame(grenierScene);
		MiniGame.TAQUIN:
			return _createMiniGame(taquinScene);
			
	printerr("MiniJeu non trouvé ! Impossible de le connect");
	return;

func _createMiniGame(game: PackedScene) -> Node2D:
	var newMiniGame = game.instantiate();
	nodeMiniGame.add_child(newMiniGame);
	return newMiniGame;
