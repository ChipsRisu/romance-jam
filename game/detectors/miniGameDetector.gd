extends Node

@export_category("Game")
@export var miniGameType: MiniGameHandler.MiniGame;

@export_category("AfterWin")
@export var changedTags: Dictionary[Situation.Key, String];
@export var dialogicTimeLineAfterWin: String;

@export_category("conditions")
@export var tag: String
@export var dayPresenceList: Array[Situation.Day]
@export var ignoreDay: bool = true



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var _tag = GameHandler.getActiveTag();
	if not tag == null and not tag.is_empty() and tag != _tag:
		return;
	
	var today = GameHandler.state.day
	
	if not self.ignoreDay and not self.dayPresenceList.has(today):
		return;
		
	var nodeMiniGame = MiniGameHandler.startMiniGame(miniGameType);
	nodeMiniGame.tree_exited.connect(_afterMiniGame);


func _afterMiniGame() -> void:
	for changeTag in changedTags:
		GameHandler.state.tags.set(changeTag, changedTags[changeTag])
	
	if dialogicTimeLineAfterWin != null and not dialogicTimeLineAfterWin.is_empty():
		Dialogic.start(dialogicTimeLineAfterWin);
