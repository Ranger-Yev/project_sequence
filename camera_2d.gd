extends Camera2D

@onready var itself = $"."
const SPEED = 1000

func _process(delta: float) -> void:
	var dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	itself.global_position += SPEED * dir * delta
