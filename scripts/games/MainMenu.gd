class_name MainMenu
extends GameParent


func _ready():
	
	self.textures = {
		"icon":TextureInfo.new("res://icon.png",1,1),
	}
	
	self.load_textures()
	
	
	var _test = $Buttons/Sawayama.connect("on_released",self,"_on_released",["Sawayama"])
	

func _on_released(_event,game):
	get_root().switch_game(game)
	
