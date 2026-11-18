extends Node2D

@onready var itself = $"."

var direction = 1#0 # -1 left, 1 right, 0 no direction
@export var speed: float = 100.0

var do_once = false

# colors for "rarities"/value distinguishment 
# TO DO -> ADD THE COLORS

func _process(delta: float) -> void:
	if !do_once:
		itself.global_position.y = 50
		do_once = true
	itself.global_position.x += speed * direction * delta
