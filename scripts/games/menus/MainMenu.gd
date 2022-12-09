extends GameParent

@onready var game_buttons = $GameButtons

func _ready() -> void:
	super()
	for child in game_buttons.get_children():
		child.connect("button_released",Callable(self,"_change_game").bind(child.name))

func _change_game(game_code: String) -> void:
	root.switch_game(game_code)
