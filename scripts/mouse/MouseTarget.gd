class_name MouseTarget
extends Area2D


func is_class(classname: String):
	return get_class() == classname
	
func get_class():
	return "MouseTarget"

func on_mouse_enter():
	pass

func on_mouse_leave():
	pass

func on_mouse_pressed(_button: int):
	pass

func on_mouse_released(_button: int):
	pass
