class_name Deck
extends Node2D

export var y_offset: int = -1
export var offset_div: int = 4

var sprite_array: Array = []
var cards: Array = []

onready var sprite: Sprite = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.visible = false

func draw_sprites():
	while(sprite_array.size() < ceil(cards.size() as float/offset_div)):
		var new_sprite = Sprite.new()
		new_sprite.centered = false
		new_sprite.texture = sprite.texture
		new_sprite.hframes = sprite.hframes
		new_sprite.vframes = sprite.vframes
		new_sprite.z_index = ceil(sprite_array.size() as float/offset_div)
		new_sprite.position.y += y_offset * ceil(sprite_array.size() as float/offset_div)
		new_sprite.frame_coords = Vector2(0,4)
		sprite_array.append(new_sprite)
		add_child(new_sprite)
	while(sprite_array.size() > ceil(cards.size() as float/offset_div)):
		sprite_array.pop_back()

func add_card(card: Card):
	cards.append(card)
	draw_sprites()
	

func deal_card() -> Card:
	var card = cards.pop_back()
	card.position.x = global_position.x
	card.position.y = global_position.y
	draw_sprites()
	return card
