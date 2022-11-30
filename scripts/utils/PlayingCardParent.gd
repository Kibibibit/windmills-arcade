class_name PlayingCardParent
extends SceneParent

### PlayingCardParent #####
# Last Update: 2022-11-30 #
# Author     : Kibi       #
# #########################

# This class should be the parent of any game that uses
# the PlayingCard.gd script. It includes methods for
# getting sprite codes for relevant cards

var _suit_names: Array

func card_suit_value_to_sprite_code(suit: int, value: int):
	return "%s%d" % [_suit_names[suit-1],value]
