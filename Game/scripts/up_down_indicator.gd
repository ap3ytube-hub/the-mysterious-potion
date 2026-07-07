extends Control

@onready var up: Sprite2D = $Up
@onready var down: Sprite2D = $Down
@onready var player: CharacterBody2D = $"../../Player"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player:
		if player.pos == 1:
			up.visible = true
			down.visible = false
		else:
			up.visible = false
			down.visible = true
