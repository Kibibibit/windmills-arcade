extends Node2D



var game_resource
var game_instance

# Called when the node enters the scene tree for the first time.
func _ready():
	game_resource = load("res://scenes/games/Sawayama.tscn")
	game_instance = game_resource.instance()
	add_child(game_instance)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
