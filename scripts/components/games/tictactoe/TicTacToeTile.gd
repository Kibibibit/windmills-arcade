class_name TicTacToeTile
extends MouseTarget

onready var sprite: Sprite = $Sprite
onready var shape: CollisionShape2D = $CollisionShape2D
onready var game: TicTacToe = get_parent().get_parent() as TicTacToe

func _ready():
	var _height: float = (sprite.texture.get_height() as float)/sprite.vframes
	var _width: float = (sprite.texture.get_width() as float)/sprite.hframes
	
	var _extent_x = _height/2
	var _extent_y = _width/2
	
	shape.position = Vector2(_extent_x,_extent_y)
	shape.shape.extents = Vector2(_extent_x, _extent_y)
