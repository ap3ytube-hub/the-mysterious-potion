extends Camera2D

@onready var player: CharacterBody2D = $"../Player"

const DIVIDE := 10.0
const SMOOTH := 5.0

func _process(delta: float) -> void:
	self.position.y = clamp()
