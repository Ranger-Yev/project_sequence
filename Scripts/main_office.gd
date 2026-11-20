extends Node2D
@onready var cam = $Camera2D
@onready var cam_button = $cam_button
@onready var itself = $"." 
@onready var light = $PointLight2D
@onready var layout3 = $Layout3

var parent
var open_cams
var run_once = false
var hacking_terminal
var terminal_cam

var look_right = false
var look_left = false
var mouse_pos
var lights_on
var lights_off
var door_closed = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Right Click"): # moved from a function because why was this not in process?????
		if lights_on:
			light.visible = false
			lights_off = true
			lights_on = false
		else:
			light.visible = true
			lights_on = true
			lights_off = false
		
	if !run_once and itself.get_parent() != null:
		parent = itself.get_parent()
		open_cams = parent.find_child("Open Cams")
		hacking_terminal = parent.find_child("hacking_terminal")
		terminal_cam = hacking_terminal.find_child("Camera2D")
		run_once = true
		
	mouse_pos = get_global_mouse_position()
	light.position = mouse_pos
	if itself.visible: cam.make_current()
	
	if lights_on:
		if 99 > randi_range(0,100):
			light.visible = true
		else:
			light.visible = false
	
	if cam.position.x <= 1:
		pass
	elif look_left:
		cam.position.x -= 500*delta
		cam_button.global_position.x -= 500*delta
	if cam.position.x >= 96:
		pass
	elif look_right:
		cam.position.x += 500*delta
		cam_button.global_position.x += 500*delta
	else:
		pass
	
func _on_left_look_mouse_entered() -> void:
	look_left = true
	pass # Replace with function body.

func _on_left_look_mouse_exited() -> void:
	look_left = false
	pass # Replace with function body.

func _on_right_look_mouse_entered() -> void:
	look_right = true
	pass # Replace with function body.

func _on_right_look_mouse_exited() -> void:
	look_right = false
	pass # Replace with function body.

func _on_button_pressed() -> void:
	open_cams.visible = true
	itself.visible = false
	hacking_terminal.visible = false

func _on_button_area_mouse_entered() -> void:
	open_cams.visible = false
	itself.visible = false
	hacking_terminal.visible = true
	terminal_cam.make_current()

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("Left Click"):
		if !door_closed:
			layout3.frame = 2
			door_closed = true
			print(door_closed)
		else: 
			layout3.frame = 0
			door_closed = false
			print(door_closed)
		
