class_name MainMenu
extends GameParent


func _ready():
	
	self.textures = {
		"icon":TextureInfo.new("res://icon.png",1,1),
		"button-sheet":TextureInfo.new("res://sprites/main_menu_button_sheet.png",1,3)
	}
	
	self.load_textures()
	
	var sawayama_button: UIButton = UIButton.new()
	sawayama_button.position.x = 100
	sawayama_button.position.y = 100
	sawayama_button.texture_code = "button-sheet"
	
	var _test = sawayama_button.connect("on_released",self,"_on_released",["Sawayama"])
	
	add_child(sawayama_button)

func _on_released(_event,game):
	get_root().switch_game(game)
	print("Got mouse release!")
	
