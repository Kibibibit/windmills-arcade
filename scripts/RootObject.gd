class_name RootObject
extends Node2D

### Root ##################
# Last Update: 2022-11-30 #
# Author     : Kibi       #
# #########################

# This is the root of the entire application

var game_resource
var game_instance

# Called when the node enters the scene tree for the first time.
func _ready():
	game_resource = load("res://scenes/games/Sawayama.tscn")
	game_instance = game_resource.instance()
	add_child(game_instance)
