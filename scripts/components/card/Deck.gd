class_name Deck
extends ResourceComponent

### Deck ##################
# Last Update: 2022-11-30 #
# Author     : Kibi       #
# #########################

# A class that stores a set of given cards,
# and can be shuffled. Draws a stack of 'card-back'
# sprites to represent the size of the deck

var deck: Array
var offset: int = 0
var sprites: Array

func _init(cards: Array = []):
	deck = cards

func _ready():
	for i in range(0, deck.size()):
		if (i%4==0):
			var sprite = Sprite.new()
			sprite.z_as_relative=true
			sprite.centered=false
			sprite.z_index=offset+1
			sprite.position.y -= offset
			sprites.append(sprite)
			sprite.texture = .get_texture('card-back')
			add_child(sprite)
			offset = offset+1

func shuffle() -> void:
	deck.shuffle()

func deal() -> Card:
	var card = deck.pop_back()
	if (deck.size() % 4 == 0):
		var sprite = sprites.pop_back()
		sprite.free()
	return card
