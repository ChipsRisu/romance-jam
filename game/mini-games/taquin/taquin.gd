extends Node2D

var tiles: Array[Sprite2D] = [];
var solved: Array[Sprite2D] = [];
var emptyTile: Sprite2D;

#region setup
func _ready() -> void:
	tiles = [$Tile5, $Tile8, $Tile2, $Tile1, $Tile9, $Tile3, $Tile4, $Tile7, $Tile6];
	
	solved = [$Tile1, $Tile2, $Tile3, $Tile4, $Tile5, $Tile6, $Tile7, $Tile8, $Tile9];
	#tiles.shuffle(); PAS faire de random car solution pas forcément possible (faq de https://www.dcode.fr/solveur-taquin-3x3)
	placeTiles();
	emptyTile = $Tile9;

func placeTiles() -> void:
	for index in range(tiles.size()):
		var tile: Sprite2D = tiles[index];
		
		tile.position.x = ((index%3)-1) * 250;
		tile.position.y = (((index/3) as int)-1) * 250;
		#print(tile.position, tile.name)
#endregion

#region tiles methodes
func _input(event) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT:
		#print(event);
		var mousePosition: Vector2 = (event as InputEventMouseButton).global_position - get_viewport_rect().size /2;
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
	swapTile.position = emptyTile.position;
	emptyTile.position = tempPos;
	
	#Le placement dans le tableau
	tiles[swapTileIndex] = emptyTile;
	tiles[emptyTileIndex] = swapTile;
	
	detectIfWin();
#endregion

func GameIsWin() -> void:
	print("Bravo le jeu est gagné");


#region private methode
func detectIfWin() -> void:
	if tiles == solved:
		GameIsWin();

func getRowFrom(y: float) -> int:
	var row = 0;
	if y < -125:
		row = -1;
	elif  y > 125:
		row = 1;
	return row;

	
func getColFrom(x: float) -> int:
	var col = 0;
	if x < -125:
		col = -1;
	elif  x > 125:
		col = 1;
	return col;
#endregion
