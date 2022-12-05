class_name MainMenu
extends GameParent


func _ready():
	
	self.textures = {
		"icon":TextureInfo.new("res://icon.png",1,1)
	}
	
	self.load_textures()
	
	var button: UIButton = UIButton.new()
	button.position.x = 100
	button.position.y = 100
	button.texture_code = "icon"
	
	var _test = button.connect("on_released",self,"_on_released")
	
	add_child(button)

func _on_released(_event):
	print("Got mouse release!")
