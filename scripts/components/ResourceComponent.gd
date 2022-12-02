class_name ResourceComponent
extends Node2D

### ResourceComponent #####
# Last Update: 2022-11-30 #
# Author     : Kibi       #
# #########################

# Common class of any other class that needs
# access to resources loaded in by the game's
# SceneParent.
# Not used for assets in the root node!

func is_class(_class: String):
	return get_class() == _class


func _get_parent():
	return get_tree().get_root().get_node("Root").get_node("Game")

func get_texture(texture: String):
	var scene_parent: SceneParent = _get_parent()
	return scene_parent.get_texture(texture)
