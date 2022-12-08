class_name MouseArea
extends Area2D


var target: MouseTarget

func _ready() -> void:
	var _listen_enter = self.connect("area_entered",self,"_on_area_entered")
	var _listen_leave = self.connect("area_exited",self,"_on_area_exited")

func _process(_delta) -> void:
	self.position = get_global_mouse_position()

func _on_area_entered(area: Area2D) -> void:
	if (!area.is_class("MouseTarget")):
		return
	var mouse_target: MouseTarget = area as MouseTarget
	if (target == null):
		target = mouse_target
		target.on_mouse_enter()
	else:
		if (mouse_target.z_index > target.z_index):
			target.on_mouse_leave()
			target = mouse_target
			target.on_mouse_enter()

func _on_area_exited(area: Area2D) -> void:
	if (!area.is_class("MouseTarget")):
		return
	var mouse_target: MouseTarget = area as MouseTarget
	if (target != null):
		if (mouse_target.get_rid() == target.get_rid()):
			target.on_mouse_leave()
			target = null

func _input(event):
	if (event is InputEventMouseButton):
		var mouse_event: InputEventMouseButton = event as InputEventMouseButton
		if (target != null):
			if (mouse_event.pressed):
				target.on_mouse_pressed(mouse_event.button_index)
			else:
				target.on_mouse_released(mouse_event.button_index)
