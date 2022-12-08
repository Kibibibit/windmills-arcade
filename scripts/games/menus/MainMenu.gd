extends GameParent

onready var game_buttons = $GameButtons

func _ready():
	for child in game_buttons.get_children():
		var _listen = child.connect("button_released",self,"_change_game",[child.name])

func _change_game(game_code: String):
	root.switch_game(game_code)
