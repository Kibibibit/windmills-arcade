extends Area2D

func _ready():
	self.monitorable = true

func _process(_delta):
	self.position = get_global_mouse_position()

func _draw():
	draw_circle(self.position, 1, Color(1,1,1))
