class_name Card
extends GameEntity


var back_frame_coords: Vector2
var front_frame_coords: Vector2
var last_face_up: bool = false
var face_up: bool = false


func _ready():
	back_frame_coords = Vector2(0,sprite.vframes-1)
	frame_coords = back_frame_coords

func _process(_delta):
	if (last_face_up != face_up):
		if (face_up):
			frame_coords = front_frame_coords
		else:
			frame_coords = back_frame_coords
		last_face_up = face_up
