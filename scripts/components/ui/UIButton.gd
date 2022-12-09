class_name UIButton
extends MouseTarget

signal button_entered()
signal button_exited()
signal button_pressed()
signal button_released()



var sprite: Sprite2D
@onready var shape: CollisionShape2D = $ButtonShape

var frame_x_coord: int

const normal_index = 0
const highlight_index = 1
const pressed_index = 2

var texture_size: Vector2

func _ready():
	if (has_node("Sprite2D")):
		sprite = get_node("Sprite2D")
	else:
		print("ERROR! UIButton ",self," has no sprite!!!!")
	var _height: float = (sprite.texture.get_height() as float)/sprite.vframes
	var _width: float = (sprite.texture.get_width() as float)/sprite.hframes
	texture_size = Vector2(_height,_width)
	
	var _extent_x = _height/2
	var _extent_y = _width/2
	
	shape.position = Vector2(_extent_x,_extent_y)
	shape.shape.extents = Vector2(_extent_x, _extent_y)

func set_frame(index: int):
	sprite.frame_coords = Vector2(frame_x_coord, index)

func on_mouse_enter():
	set_frame(highlight_index)
	emit_signal("button_entered")

func on_mouse_leave():
	set_frame(normal_index)
	emit_signal("button_exited")

func on_mouse_pressed(button: int):
	if (button == MOUSE_BUTTON_LEFT):
		set_frame(pressed_index)
		emit_signal("button_pressed")

func on_mouse_released(button: int):
	if (button == MOUSE_BUTTON_LEFT):
		set_frame(highlight_index)
		emit_signal("button_released")
