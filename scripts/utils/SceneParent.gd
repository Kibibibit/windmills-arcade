class_name SceneParent
extends Node2D

### SceneParent ###########
# Last Update: 2022-11-30 #
# Author     : Kibi       #
# #########################

# This class should be the parent of all games,
# and will contain common methods between them,
# such as resource loading, access and cleanup

onready var _textures: Dictionary = {}
onready var _texture_map: Dictionary = {}

func load_resources():
	for key in _textures.keys():
		_texture_map[key] = load(_textures[key])
		
func get_texture(texture: String):
	return _texture_map[texture]

#### TODO: Add cleanup method
