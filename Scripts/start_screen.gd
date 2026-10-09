extends Node2D


@onready var icon = $Icon
@onready var m1 = $M1
@onready var m2 = $M2
@onready var m3 = $M3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	icon.position = m1.position
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	# Up
	if Input.is_action_just_pressed("ui_down"):
		if $"Icon".position == $"M1".position:
			$"Icon".position = $"M2".position
		elif $"Icon".position == $"M2".position:
			$"Icon".position = $"M3".position
		else: 
			pass
	
	# Down
	if Input.is_action_just_pressed("ui_up"):
		if $"Icon".position == $"M3".position:
			$"Icon".position = $"M2".position
		elif $"Icon".position == $"M2".position:
			$"Icon".position = $"M1".position
		else: 
			pass
	
	# Selector
	if Input.is_action_just_pressed("ui_accept"):
		if $"Icon".position == $"M1".position:
			get_tree().change_scene_to_file("res://main_office.tscn")
		elif $"Icon".position == $"M2".position:
			pass
		else: queue_free()
	
	pass


func _on_special_timer_timeout() -> void:
	if randf_range(1,100) >= 90:
		$"Scary Bro".frame = randf_range(17,24)
	else:
		$"Scary Bro".frame = randf_range(1,16)
	pass # Replace with function body.
