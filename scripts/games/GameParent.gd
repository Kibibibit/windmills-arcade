class_name GameParent
extends Node2D


var textures: Dictionary = {}


func get_texture_info(texture: String) -> TextureInfo:
	return textures[texture]

func load_textures():
	for key in textures.keys():
		var textureInfo: TextureInfo = textures[key]
		textureInfo._load()
		textures[key] = textureInfo
