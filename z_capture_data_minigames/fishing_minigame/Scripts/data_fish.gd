extends Node2D

@onready var itself = $"."
@onready var sprite = $"sprite"

var direction = 1#0 # -1 left, 1 right, 0 no direction
@export var speed: float = 100.0

var stop: bool = false
var do_once = false
var negative_limit = 0
var positive_limit = 0

@export var data_value_array = [1, 3, 5, 10, 25]
var value = 0
# colors for "rarities"/value distinguishment 
var cheap_color = Color(0.23, 0.55, 0.044, 1.0)
var semi_cheap_color = Color(0.02, 0.69, 1.0, 1.0)
var middle_ground_color = Color(0.99, 0.129, 0.129, 1.0)
var semi_rich_color = Color(0.7, 0.0, 1.0, 1.0)
var rich_color = Color(1.0, 0.933, 0.0, 1.0)

var color_array = [cheap_color, semi_cheap_color, middle_ground_color, semi_rich_color, rich_color]

var go_positive = false

func _process(delta: float) -> void:
	if itself.global_position.x > positive_limit: go_positive = false
	if itself.global_position.x < negative_limit: go_positive = true
	if go_positive:
		direction = 1
		sprite.global_rotation_degrees = 0.0
	else: # go negative
		direction = -1
		sprite.global_rotation_degrees = -180.0
	
	if !do_once:
		speed += randf_range(-10.0, 45.5)
		do_once = true
	
	if !stop:
		itself.global_position.x += speed * direction * delta
	

func set_color(index: int) -> void:
	itself.modulate = color_array[index]

func set_limits(new_negative_limit: float, new_positive_limit: float) -> void:
	negative_limit = new_negative_limit
	positive_limit = new_positive_limit
	
func add_speed(to_be_added: float) -> void:
	speed += to_be_added
	
func set_dir(new_dir: int) -> void:
	if new_dir == -1:
		go_positive = false
	else:
		go_positive = true

func set_value(index: int) -> void:
	value = data_value_array[index]

func get_stop() -> bool: # whether this 'fish' can move/do stuff
	return stop

func get_value() -> int:
	return value

func stop_this_fish() -> void:
	stop = true
