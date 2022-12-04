class_name TextureInfo
extends Object


var path: String
var hframes: int
var vframes: int
var texture: Texture

func _init(_path: String, _hframes: int, _vframes: int):
	path = _path
	hframes = _hframes
	vframes = _vframes

func _load():
	print(path)
	texture = load(path)
