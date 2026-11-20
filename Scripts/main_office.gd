extends Node2D
@onready var cam = $Camera2D
@onready var cam_button = $cam_button
@onready var itself = $"." 
@onready var light = $PointLight2D
@onready var layout3 = $Layout3
@onready var negative_x_limit = $negative_x_limit
@onready var positive_x_limit = $positive_x_limit
@onready var left_look = $"Camera2D/Left_Look" 
@onready var right_look = $"Camera2D/Right_Look" 

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
	
	if lights_on:
		if 99 > randi_range(0,100):
			light.visible = true
		else:
			light.visible = false

	if look_left and left_look.global_position.x > negative_x_limit.global_position.x + 5.0:
		#print("Negative, ", left_look.global_position.x , " : Limit, ", negative_x_limit.global_position.x)
		cam.position.x -= 500*delta
		cam_button.global_position.x -= 500*delta
		
	if look_right and right_look.global_position.x < positive_x_limit.global_position.x - 60.0:
		#print("Positive, ", right_look.global_position.x , " : Limit, ", positive_x_limit.global_position.x)
		cam.position.x += 500*delta
		cam_button.global_position.x += 500*delta
	
func _on_left_look_mouse_entered() -> void:
	look_left = true

func _on_right_look_mouse_entered() -> void:
	look_right = true

func _on_button_pressed() -> void:
	open_cams.visible = true
	itself.visible = false
	hacking_terminal.visible = false

func _on_button_area_mouse_entered() -> void:
	terminal_cam.enabled = true
	cam.enabled = false
	terminal_cam.make_current()

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed("Left Click"):
		if !door_closed:
			layout3.frame = 2
			door_closed = true
			print(door_closed)
		else: 
			layout3.frame = 1
			door_closed = false
			print(door_closed)
		
