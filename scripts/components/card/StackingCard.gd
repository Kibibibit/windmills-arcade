class_name StackingCard
extends PlayingCard

### StackingCard ##########
# Last Update: 2022-11-30 #
# Author     : Kibi       #
# #########################

# A playing card with logic dictating how
# it should be stacked with other cards.
# Ideal for solataire

var card_x_offset: int = 0
var card_y_offset: int = 0

var player_can_place: bool
var card_consumer: bool

enum ConsumerRule {KLONDIKE,SHENZHEN,NEXT_IN_SUIT}
export(ConsumerRule) var consumer_rule

enum PlayerPlaceRule {KLONDIKE,SHENZHEN,SAME_SUIT_DESC,SAME_SUIT_SEQUENCE}
export (PlayerPlaceRule) var placement_rule


func _init(front_sprite:String,back_sprite:String,_suit:int,_value:int).(front_sprite,back_sprite,_suit,_value):
	pass

func get_class():
	return "StackingCard"


func _ready():
	if (get_parent().name.begins_with("CardSlot") || get_parent().is_class("StackingCard")):
		card_x_offset = get_parent().card_x_offset
		card_y_offset = get_parent().card_y_offset
		_face_up = get_parent()._face_up

func _process(_delta):
	if (has_node("CardBelow")):
		var child = get_node("CardBelow")
		if (child.position.x != card_x_offset):
			child.position.x = lerp(child.position.x,card_x_offset,0.1)
		if (child.position.y != card_y_offset):
			child.position.y = lerp(child.position.y,card_y_offset,0.1)

func can_move() -> bool:
	if (!player_can_place):
		return false
	else:
		if (!has_node("CardBelow")):
			return true
		else:
			return get_node("CardBelow").valid_placement(self) && get_node("CardBelow").can_move()

func valid_placement(_card: StackingCard) -> bool:
	match placement_rule:
		PlayerPlaceRule.KLONDIKE:
			return (_card.suit % 2 != suit % 2) && (_card.value -1 == value)
		PlayerPlaceRule.SHENZHEN:
			return (_card.suit != suit) && (_card.value  -1 == value)
		PlayerPlaceRule.SAME_SUIT_DESC:
			return (_card.suit == suit) &&  (_card.value  -1 == value)
		PlayerPlaceRule.SAME_SUIT_SEQUENCE:
			return (_card.suit == suit) &&  (abs(_card.value-value) == 1)
		_:
			return false

	
func add_card(_card):
	if (has_node("CardBelow")):
		return get_node("CardBelow").add_card(_card)
	_card.name = "CardBelow"
	_card.position.x -= self.global_position.x
	_card.position.y -= self.global_position.y
	_card._face_up = self._face_up
	_card.z_index = self.z_index+2
	add_child(_card)
