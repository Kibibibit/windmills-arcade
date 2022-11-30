extends PlayingCardParent


# Called when the node enters the scene tree for the first time.
func _ready():
	self._textures = {
		"card-back":"res://sprites/cards/basic-card-back.png",
		"card-front":"res://sprites/cards/basic-card-front.png",
		"starfleet1":"res://sprites/cards/sawayama/starfleet/sawayama-starfleet-ace.png",
		"starfleet2":"res://sprites/cards/sawayama/starfleet/sawayama-starfleet-two.png",
		"starfleet3":"res://sprites/cards/sawayama/starfleet/sawayama-starfleet-three.png",
		"starfleet4":"res://sprites/cards/sawayama/starfleet/sawayama-starfleet-four.png",
		"starfleet5":"res://sprites/cards/sawayama/starfleet/sawayama-starfleet-five.png",
		"starfleet6":"res://sprites/cards/sawayama/starfleet/sawayama-starfleet-six.png",
		"starfleet7":"res://sprites/cards/sawayama/starfleet/sawayama-starfleet-seven.png",
		"starfleet8":"res://sprites/cards/sawayama/starfleet/sawayama-starfleet-eight.png",
		"starfleet9":"res://sprites/cards/sawayama/starfleet/sawayama-starfleet-nine.png",
		"starfleet10":"res://sprites/cards/sawayama/starfleet/sawayama-starfleet-ten.png",
		"starfleet11":"res://sprites/cards/sawayama/starfleet/sawayama-starfleet-jack.png",
		"starfleet12":"res://sprites/cards/sawayama/starfleet/sawayama-starfleet-queen.png",
		"starfleet13":"res://sprites/cards/sawayama/starfleet/sawayama-starfleet-king.png",
	}
	
	self._suit_names = ["starfleet"]
	
	
	self.load_resources()
	var card =  PlayingCard.new("card-front","card-back",0,1)
	card.position.x = 100
	card.position.y = 100
	add_child(card)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
