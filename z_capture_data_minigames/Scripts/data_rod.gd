extends Node2D

@onready var itself = $"."

@export var speed: float = 100.0
@export var vert_speed: float = 450.0
var vert_dir = 0
var dir = 0
var space_disabled = false

func _process(delta: float) -> void:
	dir = Input.get_axis("Left", "Right")
	if vert_dir != 0:
		dir = 0
	if Input.is_action_just_pressed("Space") and vert_dir != -1 and !space_disabled:
		vert_dir = 1
	if itself.global_position.y > 620:
		vert_dir = -1
	elif itself.global_position.y == 17 or itself.global_position.y < 16:
		itself.global_position.y = 16
		vert_dir = 0
	itself.global_position.y += vert_dir * vert_speed * delta
	itself.global_position.x += dir * speed * delta
		


func _on_rod_area_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	dir = 0
	vert_dir = 0
	space_disabled = true
