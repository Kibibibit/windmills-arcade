extends PlayingCardParent

### Sawayama ##############
# Last Update: 2022-11-30 #
# Author     : Kibi       #
# #########################

# The root node of the sawayama solataire game

var dealing: bool = false
var dealing_slots: Array
var deal_timer: int
var last_deal: int
var deal_spacing: int = 100
var deal_index: int = 0

func _ready():
	# TODO: Work out how to do this with json
	self._textures = {
		"card-slot":"res://sprites/cards/card-slot.png",
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
		"bajor1":"res://sprites/cards/sawayama/bajor/sawayama-bajor-ace.png",
		"bajor2":"res://sprites/cards/sawayama/bajor/sawayama-bajor-two.png",
		"bajor3":"res://sprites/cards/sawayama/bajor/sawayama-bajor-three.png",
		"bajor4":"res://sprites/cards/sawayama/bajor/sawayama-bajor-four.png",
		"bajor5":"res://sprites/cards/sawayama/bajor/sawayama-bajor-five.png",
		"bajor6":"res://sprites/cards/sawayama/bajor/sawayama-bajor-six.png",
		"bajor7":"res://sprites/cards/sawayama/bajor/sawayama-bajor-seven.png",
		"bajor8":"res://sprites/cards/sawayama/bajor/sawayama-bajor-eight.png",
		"bajor9":"res://sprites/cards/sawayama/bajor/sawayama-bajor-nine.png",
		"bajor10":"res://sprites/cards/sawayama/bajor/sawayama-bajor-ten.png",
		"bajor11":"res://sprites/cards/sawayama/bajor/sawayama-bajor-jack.png",
		"bajor12":"res://sprites/cards/sawayama/bajor/sawayama-bajor-queen.png",
		"bajor13":"res://sprites/cards/sawayama/bajor/sawayama-bajor-king.png",
	}
	
	# TODO: Get other suits drawn
	self._suit_names = ["starfleet","bajor","starfleet","bajor"]
	
	
	self.load_resources()
	
	new_game()

func _cards():
	var cards = []
	for _suit in range(1,5):
		for _value in range(1,14):
			cards.append(PlayingCard.new("card-front","card-back",_suit,_value))
	return cards
	
func new_game():
	dealing = true
	deal_timer = 0
	var cards: Array = _cards()
	cards.shuffle()
	$Deck.add_cards(cards)
	dealing_slots = []
	for i in range(1,8):
		dealing_slots.append($PlayingField.get_node("Slot%d" % i))
		
		
func _process(delta):
	if (dealing):
		if (deal_timer - last_deal > deal_spacing):
			if (dealing_slots.size() > 0):
				if (deal_index >= dealing_slots.size()):
					deal_index = 0
					dealing_slots.pop_front()
				if (dealing_slots.size() > 0):			
					var card = $Deck.deal_card()
					dealing_slots[deal_index].add_card(card)
					last_deal = deal_timer
					deal_index += 1
				else:
					dealing = false
		deal_timer += (delta*1000 as int)
