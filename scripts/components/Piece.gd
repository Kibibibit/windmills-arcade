class_name Piece
extends ResourceComponent

var sprite: Sprite

func _ready():
	sprite = Sprite.new()
	sprite.centered = false
	sprite.z_index = 0
	.add_child(sprite)
	
func _process(_delta):
	self.sprite.position = self.position

