extends Node2D

@onready var itself = $"."

@export var speed: float = 100.0
@export var vert_speed: float = 450.0

var y_axis_positive_limit = 620.0
var vert_dir = 0
var dir = 0
var movement_disabled = false
var value = 0

func _process(delta: float) -> void:
	if !movement_disabled:
		dir = Input.get_axis("Left", "Right")
	if vert_dir != 0:
		dir = 0
	if Input.is_action_just_pressed("Space") and vert_dir != -1 and !movement_disabled:
		vert_dir = 1
	if itself.global_position.y > y_axis_positive_limit:
		vert_dir = -1
	elif itself.global_position.y == 17 or itself.global_position.y < 16:
		itself.global_position.y = 16
		vert_dir = 0
	itself.global_position.y += vert_dir * vert_speed * delta
	itself.global_position.x += dir * speed * delta
		

func set_limit(new_limit: float) -> void:
	y_axis_positive_limit = new_limit

func _on_rod_area_area_shape_entered(_area_rid: RID, area: Area2D, _area_shape_index: int, _local_shape_index: int) -> void:
	dir = 0
	vert_dir = 0
	movement_disabled = true
	var parent_of_the_touched = area.get_parent()
	parent_of_the_touched.stop_this_fish()
	value += parent_of_the_touched.get_value()
	#print(value)

func get_value_of_rod() -> int:
	return value
