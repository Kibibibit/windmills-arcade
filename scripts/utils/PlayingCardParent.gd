class_name PlayingCardParent
extends SceneParent


var _suit_names: Array

func card_suit_value_to_sprite_code(suit: int, value: int):
	print("%s%d" % [_suit_names[suit],value])
	return "%s%d" % [_suit_names[suit],value]
