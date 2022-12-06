class_name Sawayama
extends GameParent

func _ready():
	textures = {
		"card_sheet":TextureInfo.new("res://sprites/cards/sawayama_card_sheet.png",13,5)
	}
	
	
	self.load_textures()
	
	
	var card: PlayingCard = PlayingCard.new(0,5)
	card.texture_code = "card_sheet"
	
	add_child(card)

