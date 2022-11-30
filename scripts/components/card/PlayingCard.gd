class_name PlayingCard
extends Card

var suit_sprite: Array


var suit: int
var value: int

var value_sprite: Sprite

func _ready():
	value_sprite = Sprite.new()
	value_sprite.centered = false
	.add_child(sprite)
	value_sprite.texture = .get_texture(._get_parent().card_suit_value_to_sprite_code(suit,value))

func _init(front_sprite:String,back_sprite:String,_suit:int,_value:int).(front_sprite,back_sprite,true):
	suit=_suit
	value=_value
	

func _process(_delta):
	._process(_delta)
	if (value_sprite.visible != self._face_up):
		print(!self._face_up)
		value_sprite.visible = self._face_up
		.update()
	
	
