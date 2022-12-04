class_name GameObject
extends Node2D


func get_game() -> GameParent:
	return get_root().get_node("Game") as GameParent

func get_root() -> RootObject:
	return get_tree().root.get_node("Root") as RootObject
