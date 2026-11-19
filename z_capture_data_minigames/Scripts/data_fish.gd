extends Node2D

@onready var itself = $"."
@onready var sprite = $"sprite"

var direction = 1#0 # -1 left, 1 right, 0 no direction
@export var speed: float = 100.0

var do_once = false
var negative_limit = 0
var positive_limit = 0

var data_value = [1, 3, 5, 10, 25]
# colors for "rarities"/value distinguishment 
var cheap_color = Color(0.23, 0.55, 0.044, 1.0)
var semi_cheap_color = Color(0.02, 0.69, 1.0, 1.0)
var middle_ground_color = Color(0.99, 0.129, 0.129, 1.0)
var semi_rich_color = Color(0.7, 0.0, 1.0, 1.0)
var rich_color = Color(1.0, 0.933, 0.0, 1.0)

var color_array = [cheap_color, semi_cheap_color, middle_ground_color, semi_rich_color, rich_color]

var go_positive = false

func _process(delta: float) -> void:
	if !do_once:
		speed += randf_range(-10.0, 45.5)
		if negative_limit < itself.global_position.x:
			go_positive = true
	if go_positive:
		direction = 1
		sprite.global_rotation_degrees = 0.0
	else: # go negative
		direction = -1
		sprite.global_rotation_degrees = -180.0
	itself.global_position.x += speed * direction * delta
	if itself.global_position.x > positive_limit: go_positive = false
	if itself.global_position.x < negative_limit: go_positive = true

func set_color(index: int) -> void:
	itself.modulate = color_array[index]

func set_limits(new_negative_limit, new_positive_limit) -> void:
	negative_limit = new_negative_limit
	positive_limit = new_positive_limit
	
func add_speed(to_be_added: float) -> void:
	speed += to_be_added
