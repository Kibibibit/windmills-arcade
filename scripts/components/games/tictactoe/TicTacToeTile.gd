class_name TicTacToeTile
extends MouseTarget

signal tile_pressed(state)

@onready var sprite: Sprite2D = $Sprite2D
@onready var shape: CollisionShape2D = $CollisionShape2D
@onready var game: TicTacToe = get_parent().get_parent() as TicTacToe

func _ready() -> void:
	var _height: float = (sprite.texture.get_height() as float)/sprite.vframes
	var _width: float = (sprite.texture.get_width() as float)/sprite.hframes
	
	var _extent_x = _height/2
	var _extent_y = _width/2
	
	shape.position = Vector2(_extent_x,_extent_y)
	shape.shape.extents = Vector2(_extent_x, _extent_y)

func on_mouse_released(button: int) -> void:
	if (button == MOUSE_BUTTON_LEFT):
		emit_signal("tile_pressed",sprite.frame_coords.y)

func on_tile_pressed(player: int) -> void:
	sprite.frame_coords.y = player+1

func state() -> int:
	return sprite.frame_coords.y as int
