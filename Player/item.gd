extends Control

@onready var player: MainPlayer = $".."
@onready var sprite_2d: Sprite2D = $Sprite2D

const HEALING_POTION_ADDITION : int = 15

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player.inventory[player.current_item] == player.dart:
		sprite_2d.texture = player.inventory[player.current_item]["imgpath"]
		sprite_2d.scale.x = 3.0
		sprite_2d.scale.y = 3.0
	elif player.inventory[player.current_item] == player.healing_potion:
		sprite_2d.scale.x = 3.0
		sprite_2d.scale.y = 3.0
		sprite_2d.texture = player.inventory[player.current_item]["imgpath"]
		if Input.is_action_just_pressed("use_item"):
			print("health potion used")
			player.HealPlayer(HEALING_POTION_ADDITION)
			print(player.health)
			player.healing_potion.amount -= 1
			print(player.healing_potion.amount)
