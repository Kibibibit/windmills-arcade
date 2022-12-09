class_name TicTacToe
extends GameParent


@onready var new_game_button = $NewGameButton
var player: int = 0

var running: bool = false

@onready var tile_map: Dictionary = {
	"0,0":$Board/TicTacToeTile,
	"1,0":$Board/TicTacToeTile2,
	"2,0":$Board/TicTacToeTile3,
	"0,1":$Board/TicTacToeTile4,
	"1,1":$Board/TicTacToeTile5,
	"2,1":$Board/TicTacToeTile6,
	"0,2":$Board/TicTacToeTile7,
	"1,2":$Board/TicTacToeTile8,
	"2,2":$Board/TicTacToeTile9,
}

@onready var winner_x: Array = [[0,1,2],[0,1,2],[0,1,2],[0,0,0],[1,1,1],[2,2,2],[0,1,2],[0,1,2]]
@onready var winner_y: Array = [[0,0,0],[1,1,1],[2,2,2],[0,1,2],[0,1,2],[0,1,2],[0,1,2],[2,1,0]]

func new_game() -> void:
	running = true
	player = 0
	for key in tile_map.keys():
		tile_map[key].sprite.frame_coords.y = 0

func _ready() -> void:
	super()
	for key in tile_map.keys():
		tile_map[key].connect("tile_pressed",Callable(self,"_on_tile_pressed").bind(key))
	new_game_button.connect("button_released",Callable(self,"new_game"))

func get_tile(x: int, y:int):
	return tile_map["%d,%d"%[x,y]]

func switch_player()->void:
	player = abs(player-1) as int
	
func check_winner() -> void:
	var winner_state: int = 0
	for i in range(0,winner_x.size()):
		var x_set = winner_x[i]
		var y_set = winner_y[i]
		var state:int = 0
		
		var winner = true
		for j in range(0,x_set.size()):
			var tile_state = get_tile(x_set[j],y_set[j]).state()
			if (j == 0):
				state = tile_state
			if(state != tile_state):
				winner = false
				break
		if (winner):
			winner_state = state
			break
	if (winner_state != 0):
		print("Player ",winner_state," won!")
		running = false

func _on_tile_pressed(state: int, loc: String) -> void:
	if (state != 0 || !running):
		return
	
	tile_map[loc].on_tile_pressed(player)
	check_winner()
	switch_player()
