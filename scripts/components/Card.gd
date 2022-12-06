class_name Card
extends GameEntity

signal card_arrived()

var back_frame_coords: Vector2
var front_frame_coords: Vector2
var last_face_up: bool = false
var face_up: bool = false
var speed: float = 0.2
var emitted: bool = false

func change_parent(new_parent: Node2D):
	var parent: Node2D = get_parent() as Node2D
	var gpos
	if (parent == null):
		gpos = self.position
	else:
		gpos = parent.global_position
	self.position.x = gpos.x - new_parent.global_position.x
	self.position.y = gpos.y - new_parent.global_position.y
	if (parent != null):
		get_parent().remove_child(self)
	new_parent.add_child(self)
	emitted = false

func _ready():
	back_frame_coords = Vector2(0,sprite.vframes-1)
	frame_coords = back_frame_coords

func _process(_delta):
	do_flip()
	chase_parent()

func chase_parent() -> void:
	self.position.x = lerp(self.position.x, 0, speed)
	self.position.y = lerp(self.position.y, 0, speed)
	if (abs(self.position.x - 0) < 0.5):
		self.position.x = 0
	if (abs(self.position.y - 0) < 0.5):
		self.position.y = 0
	if (self.position.x == 0 && self.position.y == 0 && !emitted):
		emit_signal("card_arrived")
		print("Emitting!")
		emitted = true
	

func do_flip() -> void:
	if (last_face_up != face_up):
		if (face_up):
			frame_coords = front_frame_coords
		else:
			frame_coords = back_frame_coords
		last_face_up = face_up
