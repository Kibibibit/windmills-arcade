class_name Card
extends Piece

### Card ##################
# Last Update: 2022-11-30 #
# Author     : Kibi       #
# #########################

# Parent class for any Piece that can
# be flipped over. Ideal for cards, but could also include
# Mahjong tiles, reversi pieces or even a coin or something

var _face_up: bool
var _last_face_up: bool
var _back_sprite: String
var _front_sprite: String


func _init(front_sprite:String,back_sprite:String,face_up:bool = false):
	_back_sprite = back_sprite
	_front_sprite = front_sprite
	_face_up = face_up
	_last_face_up = face_up

func _ready():
	_set_sprite()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	._process(_delta)
	if (_face_up != _last_face_up):
		_set_sprite()
	

func _set_sprite() -> void:
	if (_face_up):
		self.sprite.texture = .get_texture(_front_sprite)
	else:
		self.sprite.texture = .get_texture(_back_sprite)
	_last_face_up = _face_up
	.update()

# Getters
func get_face_up() -> bool:
	return _face_up





