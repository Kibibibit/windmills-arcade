class_name TextureInfo
extends Object


var path: String
var hframes: int
var vframes: int
var texture: Texture
var is_loaded: bool = false

func _init(_path: String, _hframes: int, _vframes: int):
	path = _path
	hframes = _hframes
	vframes = _vframes

func _load() -> void:
	print("Loading texture: ",path)
	texture = load(path)
	is_loaded = true

func get_texture()->Texture:
	if (!is_loaded):
		_load()
	return texture
