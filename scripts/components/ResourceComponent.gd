class_name ResourceComponent
extends Node2D

func _get_parent():
	return get_tree().get_root().get_node("Root").get_node("Game")

func get_texture(texture: String):
	var scene_parent: SceneParent = _get_parent()
	return scene_parent.get_texture(texture)
