class_name UIButton
extends GameEntity

signal on_pressed(mouse_event)
signal on_released(mouse_event)

var signal_prefix

var area_2d: Area2D
var mouse_entered: bool = false

func _ready():
	area_2d = Area2D.new()
	area_2d.monitoring = true
	
	var shape: CollisionShape2D = CollisionShape2D.new()
	shape.shape = RectangleShape2D.new()
	shape.shape.extents = sprite.texture.get_size()
	
	area_2d.add_child(shape)
	add_child(area_2d)
	
	var _entered = area_2d.connect("area_entered",self,"_on_area_entered")
	var _exited = area_2d.connect("area_exited",self,"_on_area_exited")

func _input(event):
	if (event is InputEventMouseButton && mouse_entered && event.button_index == BUTTON_LEFT):
		if (event.pressed):
			emit_signal("on_pressed",event)
		else:
			emit_signal("on_released",event)

func _process(_delta):
	pass

func _on_area_entered(area: Area2D) -> void:
	if (area.name != "MouseArea"):
		return
	mouse_entered = true

func _on_area_exited(area: Area2D) -> void:
	if (area.name != "MouseArea"):
		return
	mouse_entered = false
