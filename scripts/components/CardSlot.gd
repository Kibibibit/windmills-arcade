class_name CardSlot
extends Node2D

signal card_placed(card)

export var parent_y_offset: int = 15
export var can_pick_up: bool = true

func add_child(node,legible_unique_name=false):
	
	if (node.name == "Card"):
		if (!has_node("Card")):
			.add_child(node,legible_unique_name)
			node.connect("card_arrived",self,"_on_card_arrived")
		else:
			node.can_pick_up = can_pick_up
			node.parent_y_offset = parent_y_offset
			get_node("Card").add_child(node)
		
	else:
		.add_child(node,legible_unique_name)

func remove_child(node):
	if (node.name == "Card"):
		node.disconnect("card_arrived",self,"_on_card_arrived")

func _on_card_arrived(card: Card):
	emit_signal("card_placed",card)
