class_name GameParent
extends Node2D

var root: Root

func _ready():
	root = get_parent() as Root
