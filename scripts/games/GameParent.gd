class_name GameParent
extends Node2D


var textures: Dictionary = {}


func get_texture_info(texture: String) -> TextureInfo:
	return textures[texture]

func get_root() -> RootObject:
	return get_tree().root.get_node("Root") as RootObject

func load_textures():
	for key in textures.keys():
		var textureInfo: TextureInfo = textures[key]
		textureInfo._load()
		textures[key] = textureInfo

func new_game() -> void:
	pass
