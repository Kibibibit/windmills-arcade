class_name MouseArea
extends Area2D


var target: MouseTarget
var targets: Array

func _ready() -> void:
	var _listen_enter = self.connect("area_entered",self,"_on_area_entered")
	var _listen_leave = self.connect("area_exited",self,"_on_area_exited")

func _process(_delta) -> void:
	self.position = get_global_mouse_position()

func _on_area_entered(area: Area2D) -> void:
	if (!area.is_class("MouseTarget")):
		return
	var mouse_target: MouseTarget = area as MouseTarget
	targets.append(mouse_target)
	sort_targets()

func _on_area_exited(area: Area2D) -> void:
	if (!area.is_class("MouseTarget")):
		return
	var mouse_target: MouseTarget = area as MouseTarget
	remove_target(mouse_target)
	sort_targets()

func _input(event):
	if (event is InputEventMouseButton):
		var mouse_event: InputEventMouseButton = event as InputEventMouseButton
		if (target != null):
			if (mouse_event.pressed):
				target.on_mouse_pressed(mouse_event.button_index)
			else:
				target.on_mouse_released(mouse_event.button_index)

func remove_target(mouse_target: MouseTarget):
	var index: int = 0
	var found: bool = false
	for i in targets:
		if i.get_rid() == mouse_target.get_rid():
			found = true
			break
		index += 1
	if (found):
		targets.remove(index)

func sort_targets():
	targets.sort_custom(self,"z_index_sort")
	if (target != null && targets.size() == 0):
		target.on_mouse_leave()
		target = null
		return
	var new_target: MouseTarget = targets[0]
	
	if (target == null):
		new_target.on_mouse_enter()
		target = new_target
		return
	if (new_target.get_rid() != target.get_rid()):
		target.on_mouse_leave()
		new_target.on_mouse_enter()
		target = new_target
	
	

func z_index_sort(a,b):
	return a.z_index > b.z_index
