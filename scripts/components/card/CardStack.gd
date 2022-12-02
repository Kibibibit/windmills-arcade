class_name CardStack
extends Node2D


export var card_x_offset: int = 0
export var card_y_offset: int = 0
export var card_offset_div: int = 1

export var player_can_place: bool
export var card_consumer: bool

enum ConsumerRule {KLONDIKE,SHENZHEN,NEXT_IN_SUIT}
export(ConsumerRule) var consumer_rule

enum PlayerPlaceRule {EMPTY,KLONDIKE,SHENZHEN,SAME_SUIT_DESC,SAME_SUIT_SEQUENCE}
export (PlayerPlaceRule) var placement_rule

enum CardFaceUpRule {ONCE_EMPTY,FACE_UP,FACE_DOWN}
export (CardFaceUpRule) var cards_face_up

var emptied: bool = false


var cards: Array

func add_card(card: Card):
	var stack_size: float = cards.size() as float
	card.position = self.position
	card.position.x += floor(stack_size/card_offset_div)*card_x_offset
	card.position.y += floor(stack_size/card_offset_div)*card_y_offset
	card._face_up = card_face_up()
	card.z_index = cards.size()*2
	cards.append(card)
	add_child(card)
	
	

func card_face_up():
	match cards_face_up:
		CardFaceUpRule.ONCE_EMPTY:
			return emptied
		CardFaceUpRule.FACE_UP:
			return true
		CardFaceUpRule.FACE_DOWN:
			return false

func add_cards(new_cards: Array):
	for card in new_cards:
		add_card(card)

func deal_card():
	pass

func _ready():
	self.position.x = 40
	self.position.y = 40

func _process(_delta):
	$Sprite.position = self.position


