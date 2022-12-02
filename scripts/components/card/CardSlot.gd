extends Node2D


export var card_x_offset: int = 0
export var card_y_offset: int = 10
export var player_can_place: bool = true
export var _face_up: bool

func _process(_delta):
	if (has_node("CardBelow")):
		var child = get_node("CardBelow")
		if (child.position.x != 0):
			child.position.x = lerp(child.position.x,0,0.1)
		if (child.position.y != 0):
			child.position.y = lerp(child.position.y,0,0.1)

func add_card(_card):
	if (has_node("CardBelow")):
		return get_node("CardBelow").add_card(_card)
	_card.name = "CardBelow"
	_card.position.x -= self.global_position.x
	_card.position.y -= self.global_position.y
	_card.z_index = self.z_index+2
	add_child(_card)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
