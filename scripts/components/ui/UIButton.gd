class_name UIButton
extends Node2D

signal on_pressed(mouse_event)
signal on_released(mouse_event)


onready var area_2d: Area2D = $Area2D
var mouse_entered: bool = false
onready var shape: CollisionShape2D = $Area2D/CollisionShape2D
onready var sprite: Sprite = $Sprite

func _ready():
	
	
	var y_extent: int = ((sprite.texture.get_height()as float)/(sprite.vframes as float)/2) as int
	var x_extent: int = ((sprite.texture.get_width()as float)/(sprite.hframes as float)) as int
	shape.position.y += y_extent
	shape.shape.extents = Vector2(x_extent,y_extent)
	
	var _entered = area_2d.connect("area_entered",self,"_on_area_entered")
	var _exited = area_2d.connect("area_exited",self,"_on_area_exited")


func _input(event):
	if (event is InputEventMouseButton && mouse_entered && event.button_index == BUTTON_LEFT):
		if (event.pressed):
			sprite.frame_coords = Vector2(sprite.frame_coords.x,2)
			emit_signal("on_pressed",event)
		else:
			sprite.frame_coords = Vector2(sprite.frame_coords.x,1)
			emit_signal("on_released",event)

func _process(_delta):
	pass

func _on_area_entered(area: Area2D) -> void:
	if (area.name != "MouseArea"):
		return
	mouse_entered = true
	sprite.frame_coords = Vector2(sprite.frame_coords.x,1)
	update()

func _on_area_exited(area: Area2D) -> void:
	if (area.name != "MouseArea"):
		return
	mouse_entered = false
	sprite.frame_coords = Vector2(sprite.frame_coords.x,0)
	update()
