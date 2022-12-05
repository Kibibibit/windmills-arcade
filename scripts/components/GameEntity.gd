class_name GameEntity
extends GameObject

var sprite: Sprite
var frame_coords: Vector2
var texture_code: String
var texture_info: TextureInfo
func _ready():
	sprite = Sprite.new()
	texture_info = .get_game().get_texture_info(texture_code)
	sprite.centered = false
	sprite.hframes = texture_info.hframes
	sprite.vframes = texture_info.vframes
	sprite.frame_coords = frame_coords
	sprite.texture = texture_info.get_texture()
	add_child(sprite)
	
func _exit_tree():
	remove_child(sprite)
