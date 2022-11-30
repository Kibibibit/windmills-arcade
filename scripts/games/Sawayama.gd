extends SceneParent


# Called when the node enters the scene tree for the first time.
func _ready():
	self._textures = {
		"card-back":"res://sprites/basic-card-back.png",
		"card-front":"res://sprites/basic-card-front.png",
	}
	
	
	self.load_resources()
	var card = Card.new("card-front","card-back",false)
	add_child(card)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
