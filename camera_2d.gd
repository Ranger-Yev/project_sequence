extends Camera2D

@onready var itself = $"."
const SPEED = 1000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	itself.global_position += SPEED * dir * delta
