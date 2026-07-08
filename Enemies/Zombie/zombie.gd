extends CharacterBody2D

@export var move_timer := 1.0
@export var step_size := 64.0

var GamePlayer : Node2D = null

const zombie_damage = 10

func _ready() -> void:
	move_loop()

func move_loop() -> void:
	while true:
		position.x -= step_size
		await get_tree().create_timer(move_timer).timeout


func _zombie_collision_entered(body: Node2D) -> void:
	if !body.is_in_group("player"):
		return
	GamePlayer = body


func zombie_offscreen() -> void:
	print("zombie queue free")
	GamePlayer.DamagePlayer(zombie_damage + 10)
	queue_free()
