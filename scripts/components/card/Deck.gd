class_name Deck
extends ResourceComponent

### Deck ##################
# Last Update: 2022-11-30 #
# Author     : Kibi       #
# #########################

# A class that stores a set of given cards,
# and can be shuffled. Draws a stack of 'card-back'
# sprites to represent the size of the deck

var deck: Array = []
var offset: int = 0
var sprites: Array

func add_cards(cards: Array):
	for card in cards:
		add_card(card)

func add_card(card: Card):
	deck.append(card)
	var sprite = Sprite.new()
	sprite.z_as_relative=true
	sprite.centered=false
	sprite.z_index=offset+1
	sprite.position.y -= offset
	sprites.append(sprite)
	sprite.texture = .get_texture('card-back')
	add_child(sprite)
	offset+= 1

func shuffle() -> void:
	deck.shuffle()

func size() -> int:
	return deck.size()

func deal() -> Card:
	if (deck.size() <= 0):
		return null
	var card = deck.pop_back()
	card.position.x = self.position.x
	card.position.y = self.position.y + deck.size()
	sprites.pop_back().free()
		
	return card
