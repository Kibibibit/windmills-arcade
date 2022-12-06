class_name Sawayama
extends GameParent

onready var deck: Deck = $Immutables/Deck

func _ready():
	textures = {
		"card_sheet":TextureInfo.new("res://sprites/cards/sawayama_card_sheet.png",13,5)
	}
	
	
	self.load_textures()
	

func new_game() -> void:
	
	for child in get_children():
		if (child.name != "Immutables"):
			child.queue_free()
			remove_child(child)
	
	for suit in range(0,4):
		for value in range(0,14):
			var card: PlayingCard = PlayingCard.new(suit,value)
			card.texture_code = "card_sheet"
			deck.add_card((card))
	
	var card: PlayingCard = deck.deal_card() as PlayingCard
	card.change_parent(get_parent().get_node("MouseArea"))
