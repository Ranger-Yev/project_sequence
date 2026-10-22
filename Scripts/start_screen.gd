extends Node2D

@onready var scary_bro = $"Scary Bro"
@onready var icon = $Icon
@onready var icon_timer = $"Icon timer"
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
		if icon.position == m1.position:
			icon.position = m2.position
			
		elif icon.position == m2.position:
			icon.position = m3.position
		else: 
			pass
	
	# Down
	if Input.is_action_just_pressed("ui_up"):
		if icon.position == m3.position:
			icon.position = m2.position
		elif icon.position == m2.position:
			icon.position = m1.position
		else: 
			pass
	
	# Selector
	if Input.is_action_just_pressed("ui_accept"):
		if icon.position == m1.position:
			get_tree().change_scene_to_file("res://main_office.tscn")
		elif icon.position == m2.position:
			pass
		else: queue_free()
	
	pass


func _on_special_timer_timeout() -> void:
	if randf_range(1,100) >= 90:
		icon.frame = randf_range(32,60)
		scary_bro.frame = randf_range(17,24)
	else:
		icon.frame = randf_range(32,60)
		scary_bro.frame = randf_range(1,16)
	pass # Replace with function body.
