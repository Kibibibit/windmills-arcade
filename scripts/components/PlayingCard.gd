class_name PlayingCard
extends Card

var suit: int
var value: int

func _init(_suit: int, _value: int):
	suit = _suit
	value = _value
	

func _ready():
	front_frame_coords = Vector2(value,suit)
