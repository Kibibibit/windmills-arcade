class_name SceneParent
extends Node2D


onready var _textures: Dictionary = {}
onready var _texture_map: Dictionary = {}

func load_resources():
	for key in _textures.keys():
		_texture_map[key] = load(_textures[key])
		
func get_texture(texture: String):
	return _texture_map[texture]
