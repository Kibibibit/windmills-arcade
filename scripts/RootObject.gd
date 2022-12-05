class_name RootObject
extends Node2D

### Root ##################
# Last Update: 2022-11-30 #
# Author     : Kibi       #
# #########################

# This is the root of the entire application

var game_instance

onready var games = {
	"MainMenu":load("res://scenes/games/MainMenu.tscn"),
	"Sawayama":load("res://scenes/games/Sawayama.tscn")
}

func _ready():
	switch_game("MainMenu")

func switch_game(game_name:String):
	if (game_instance != null):
		remove_child(game_instance)
	game_instance = games[game_name].instance()
	add_child(game_instance)
