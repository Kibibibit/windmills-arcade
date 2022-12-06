class_name Sawayama
extends GameParent

onready var deck: Deck = $Immutables/Deck
onready var slots: Node2D = $Immutables/Slots

var dealing: bool = false
var deal_index: int = 0
var deal_index_min: int = 0

func _ready():
	textures = {
		"card_sheet":TextureInfo.new("res://sprites/cards/sawayama_card_sheet.png",13,5)
	}
	self.load_textures()
	
	for child in slots.get_children():
		var _a = child.connect("card_placed",self,"_on_card_placed")

func _on_card_placed(_card: Card):
	if (dealing):
		deal()
	
func deal():
	var card: PlayingCard = deck.deal_card() as PlayingCard
	
	var slot = slots.get_children()[deal_index]
	card.change_parent(slot)
	
	deal_index += 1
	if (deal_index >= 7):
		deal_index_min += 1
		deal_index = deal_index_min
		if (deal_index_min >= 7):
			dealing = false
	

func new_game() -> void:
	
	dealing = true
	
	for child in get_children():
		if (child.name != "Immutables"):
			child.queue_free()
			remove_child(child)
	
	for suit in range(0,4):
		for value in range(0,13):
			var card: StackingCard = StackingCard.new(suit,value)
			card.name = "Card"
			card.texture_code = "card_sheet"
			deck.add_card(card)
	deal()
	
	
