class_name GameEntity
extends GameObject

var sprite: Sprite
var frame_coords: Vector2
var texture_code: String

func _ready():
	sprite = Sprite.new()
	var textureInfo: TextureInfo = .get_game().get_texture(texture_code)
	sprite.hframes = textureInfo.hframes
	sprite.vframes = textureInfo.vframes
	sprite.frame_coords = frame_coords
	add_child(sprite)
	
func _exit_tree():
	remove_child(sprite)
	
