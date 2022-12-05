extends Area2D

func _ready():
	self.monitorable = true

func _process(_delta):
	self.position = get_global_mouse_position()
