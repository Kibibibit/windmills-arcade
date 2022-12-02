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

export var slot_visible: bool = true

var emptied: bool = false


var cards: Array

func add_card(card: Card):
	card.position.x -= self.global_position.x
	card.position.y -= self.global_position.y
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

func deal_card() -> Card:
	var card = cards.pop_back()
	card.position.x += self.position.x
	card.position.y += self.position.y
	remove_child(card)
	return card

func _ready():
	if !slot_visible:
		$Sprite.free()

func _process(_delta):
	var i: float = 0.0
	for card in cards:
		
		var card_x = floor(i/card_offset_div)*card_x_offset
		var card_y = floor(i/card_offset_div)*card_y_offset
		
		if (card.position.x != card_x):
			card.position.x = lerp(card.position.x,card_x,0.1)
		if (card.position.y != card_y):
			card.position.y = lerp(card.position.y,card_y,0.1)
		
		i += 1.0


