extends CharacterBody2D
class_name MainPlayer

var pos : int = 1


const SPEED : float = 300.0
const JUMP_VELOCITY : float = -400.0
const TERMINAL_VEL : float = -10000.0

var health : int = 100

var dart: Dictionary = {
	"name": "Dart",
	"amount": INF,
	"imgpath": preload("res://Game/img/dart.png")
}
var healing_potion: Dictionary = {
	"name": "Healing Potion",
	"amount": 3,
	"imgpath": preload("res://Game/img/healthpotion.png")
}

var inventory: Array = [dart, healing_potion]
var inv_index: int = 0
var current_item = inv_index

func _physics_process(delta: float) -> void:
	if velocity.y > TERMINAL_VEL:
		if pos != 1:
			velocity.y += get_gravity().y * delta
		else:
			velocity.y -= get_gravity().y * delta

	# Handle jump.
	if Input.is_action_just_pressed("swap_gravity") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	move_and_slide()


func _process(delta: float) -> void:
	print(health)
	
	if Input.is_action_just_pressed("swap_gravity"):
		FlipGravity()
	
	if Input.is_action_just_pressed("upitem"):
		inv_index -= 1
		inv_index = clamp(inv_index, 0, inventory.size() - 1)
	current_item = inv_index

	if Input.is_action_just_pressed("downitem"):
		inv_index += 1
		inv_index = clamp(inv_index, 0, inventory.size() - 1)
		current_item = inv_index

func FlipGravity():
	if pos == 1:
		pos = 0
		print("pos 0")
	else:
		pos = 1
		print("pos 1")

func DamagePlayer(dmg):
	health -= dmg

func HealPlayer(heal_amount):
	health += heal_amount
