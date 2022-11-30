class_name Piece
extends ResourceComponent

### Piece #################
# Last Update: 2022-11-30 #
# Author     : Kibi       #
# #########################

# This class represents any piece 
# that can be interacted with in any of the games.
# Currently just with basic sprite setup

var sprite: Sprite

func _ready():
	sprite = Sprite.new()
	sprite.centered = false
	sprite.z_index = 0
	.add_child(sprite)
	
func _process(_delta):
	self.sprite.position = self.position

# TODO: Cleanup method for sprite
