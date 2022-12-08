class_name Root
extends Node2D


onready var games: Dictionary = {
	"main-menu":load("res://scenes/games/menus/MainMenu.tscn"),
	"tictactoe":load("res://scenes/games/TicTacToe.tscn")
}

var game

func _ready():
	switch_game("main-menu")

func get_mouse() -> MouseArea:
	return get_node("MouseArea") as MouseArea

func switch_game(game_code: String):
	if (game != null):
		game.queue_free()
		remove_child(game)
	
	game = games[game_code].instance()
	add_child(game)
