class_name StackingCard
extends PlayingCard

func _init(_suit: int, _value: int).(_suit,_value):
	pass


func add_child(node,legible_unique_name=false):
	
	if (node.name == "Card"):
		if (!has_node("Card")):
			.add_child(node,legible_unique_name)
			node.connect("card_arrived",self,"_on_card_arrived")
		else:
			get_node("Card").add_child(node)
		
	else:
		.add_child(node,legible_unique_name)

func remove_child(node):
	if (node.name == "Card"):
		node.disconnect("card_arrived",self,"_on_card_arrived")

func _on_card_arrived(card: Card):
	emit_signal("card_arrived",card)
	
func _on_area_entered(area: Area2D):
	if (!has_node("Card") && area.name == "MouseArea"):
		print("Hi!",self.value,self.suit)
