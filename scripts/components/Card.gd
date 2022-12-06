class_name Card
extends GameEntity

signal card_arrived(card)

var back_frame_coords: Vector2
var front_frame_coords: Vector2
var last_face_up: bool = false
var face_up: bool = false
var speed: float = 0.4
var emitted: bool = false
var parent_y_offset: int = 0
var parent_x_offset: int = 0
var can_pick_up: bool = false

onready var area_2d: Area2D = Area2D.new()

func _ready():
	back_frame_coords = Vector2(0,sprite.vframes-1)
	frame_coords = back_frame_coords
	
	var collision_box = CollisionShape2D.new()
	collision_box.shape = RectangleShape2D.new()
	
	var texture_size = Vector2(sprite.texture.get_width() as float/sprite.hframes,sprite.texture.get_height() as float/sprite.vframes)
	collision_box.shape.extents = texture_size
	collision_box.position.x += texture_size.x/2
	collision_box.position.y += texture_size.y/2
	
	area_2d.add_child(collision_box)
	
	var _area = area_2d.connect("area_entered",self,"_on_area_entered")
	add_child(area_2d)

func _draw():
	var pos = area_2d.get_child(0).position
	var size = area_2d.get_child(0).shape.extents
	
	var draw_pos: Vector2 = Vector2(pos.x-size.x/2,pos.y-size.y/2)
	draw_rect(Rect2(draw_pos,size),Color(1,0,0))

func _on_area_entered(area: Area2D):
	pass

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


func _process(_delta):
	do_flip()
	chase_parent()

func chase_parent() -> void:
	self.position.x = lerp(self.position.x, parent_x_offset, speed)
	self.position.y = lerp(self.position.y, parent_y_offset, speed)
	if (abs(self.position.x - parent_x_offset) < 1):
		self.position.x = parent_x_offset
	if (abs(self.position.y - parent_y_offset) < 1):
		self.position.y = parent_y_offset
	if (self.position.x == parent_x_offset && self.position.y == parent_y_offset && !emitted):
		emit_signal("card_arrived", self)
		emitted = true
	

func do_flip() -> void:
	if (last_face_up != face_up):
		if (face_up):
			frame_coords = front_frame_coords
		else:
			frame_coords = back_frame_coords
		last_face_up = face_up
