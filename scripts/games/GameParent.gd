class_name GameParent
extends Node2D

var root: Root

func _ready() -> void:
	root = get_parent() as Root

func new_game() -> void:
	pass
