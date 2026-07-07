extends VBoxContainer

@onready var item_1: Control = $Item1
@onready var item_2: Control = $Item2
@onready var item_3: Control = $Item3
@onready var item_4: Control = $Item4
@onready var item_5: Control = $Item5
@onready var item_6: Control = $Item6

@onready var player: CharacterBody2D = $"../../../Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.position.y = - get_child_count() * 70 / 2
	
	if player.current_item == 0:
		item_1.get_child(0).position.x = 15.0
		item_1.get_node("ColorRect/Control").visible = true
		item_1.get_node("ColorRect/Control/Name").text = player.inventory[0]["name"]
	else:
		item_1.get_child(0).position.x = 0.0
		item_1.get_node("ColorRect/Control").visible = false

	if player.current_item == 1:
		item_2.get_child(0).position.x = 15.0
		item_2.get_node("Sprite2D/Control").visible = true
		item_2.get_node("Sprite2D/Control/Name").text = player.inventory[1]["name"]
	else:
		item_2.get_child(0).position.x = 0.0
		item_2.get_node("Sprite2D/Control").visible = false

	calculate_item_vis()

func calculate_item_vis():
	if player.inventory.size() >= 1:
		item_1.visible = true
		if player.inventory.size() >= 2:
			item_2.visible = true
	else:
		item_1.visible = false
