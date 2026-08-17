extends Node2D

var tiles: Array[Sprite2D] = [];
var solved: Array[Sprite2D] = [];
var emptyTile: Sprite2D;
var gameIsFinish = false;

var viewportSize: Vector2;
var tileSize: float = 300;

#region setup
func _ready() -> void:
	tiles = [$Tile5, $Tile8, $Tile2, $Tile1, $Tile9, $Tile3, $Tile4, $Tile7, $Tile6];
	#tiles = [$Tile1, $Tile2, $Tile3, $Tile4, $Tile5, $Tile6, $Tile7, $Tile9, $Tile8]; #Pour le test
	
	solved = [$Tile1, $Tile2, $Tile3, $Tile4, $Tile5, $Tile6, $Tile7, $Tile8, $Tile9];
	#tiles.shuffle(); PAS faire de random car solution pas forcément possible (faq de https://www.dcode.fr/solveur-taquin-3x3)
	
	viewportSize = get_viewport_rect().size / 2;
	position = viewportSize;
	
	tileSize = (get_viewport_rect().size.y - (viewportSize.y / 3)) / 3;
	var tileScale = tileSize/579;
	for tile in tiles:
		tile.scale = Vector2(tileScale,tileScale);
	
	placeTiles();
	emptyTile = $Tile9;
	

func placeTiles() -> void:
	for index in range(tiles.size()):
		var tile: Sprite2D = tiles[index];
		
		tile.position.x = ((index%3)-1) * tileSize;
		tile.position.y = (((index/3) as int)-1) * tileSize;
		#print(tile.position, tile.name)
#endregion

#region tiles methodes
func _input(event) -> void:
	if gameIsFinish or not visible:
		return;
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		#print(event);
		var mousePosition: Vector2 = (event as InputEventMouseButton).global_position - viewportSize;
		#print(mousePosition)
		var col = getColFrom(mousePosition.x);
		var row = getRowFrom(mousePosition.y);
		#print(cols)
		#print(rows)
		
		checkNeighbours(row,col);

func checkNeighbours(row, col) -> void:
	var EmptyCol = getColFrom(emptyTile.position.x);
	var EmptyRow = getRowFrom(emptyTile.position.y);
	
	if row == EmptyRow and col == EmptyCol:
		return;
	
	#print(row, " ",  EmptyRow, " / ", col , " ", EmptyCol)
	if row + EmptyRow != 0 and col == EmptyCol:
		#print("Changement de row");
		swap(row, col, EmptyRow, EmptyCol);
	if col + EmptyCol != 0 and row == EmptyRow:
		#print("Changement de col");
		swap(row, col, EmptyRow, EmptyCol);
	

func swap(row:int, col: int, EmptyRow:int, EmptyCol: int) -> void:
	#print(row, " ", col)
	var swapTileIndex: int = (col+1)+(row+1)*3;
	var emptyTileIndex: int = (EmptyCol+1)+(EmptyRow+1)*3;
	
	#Les positions des tiles
	var swapTile: Sprite2D = tiles[swapTileIndex];
	var tempPos: Vector2 = swapTile.position;
	
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_LINEAR)
	tween.set_ease(Tween.EASE_IN)
	await tween.tween_property(swapTile, "position", emptyTile.position, 0.2)
	
	#swapTile.position = emptyTile.position ;
	emptyTile.position = tempPos;
	
	#Le placement dans le tableau
	tiles[swapTileIndex] = emptyTile;
	tiles[emptyTileIndex] = swapTile;
	
	detectIfWin();
#endregion

func GameIsWin() -> void:
	gameIsFinish = true;
	$AnimationPlayer.play("finishGame");
	await $AnimationPlayer.animation_finished;
	#TODO faire la suite pour sortire du minijeu. Pas oublié de queue free le jeu ou le rendre visible false;


#region private methode
func detectIfWin() -> void:
	if tiles == solved:
		GameIsWin();

func getRowFrom(y: float) -> int:
	var row = 0;
	if y < -tileSize/2:
		row = -1;
	elif  y > tileSize/2:
		row = 1;
	return row;

	
func getColFrom(x: float) -> int:
	var col = 0;
	if x < -tileSize/2:
		col = -1;
	elif  x > tileSize/2:
		col = 1;
	return col;
#endregion
