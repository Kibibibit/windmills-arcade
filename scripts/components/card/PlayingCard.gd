class_name PlayingCard
extends Card


var suit: int
var value: int

var value_sprite: Sprite

func _ready():
	value_sprite = Sprite.new()
	value_sprite.centered = false
	value_sprite.z_as_relative = true
	value_sprite.z_index = 1
	value_sprite.texture = .get_texture(._get_parent().card_suit_value_to_sprite_code(suit,value))
	#_draw_values()
	add_child(value_sprite)

func _init(front_sprite:String,back_sprite:String,_suit:int,_value:int).(front_sprite,back_sprite,false):
	suit=_suit
	value=_value

func _draw_values():
	if (value_sprite.visible != self._face_up):
		value_sprite.visible = self._face_up
		.update()

func _process(_delta):
	value_sprite.position = self.position
	._process(_delta)
	_draw_values()
