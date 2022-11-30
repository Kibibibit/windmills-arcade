class_name Piece
extends Node2D

var sprite: Sprite


# Called when the node enters the scene tree for the first time.
func _ready():
	sprite = Sprite.new()
	sprite.centered = false
	.add_child(sprite)
	
func _process(_delta):
	self.sprite.position = self.position

func _get_parent():
	return get_tree().get_root().get_node("Root").get_node("Game")

func get_texture(texture: String):
	var scene_parent: SceneParent = _get_parent()
	return scene_parent.get_texture(texture)
