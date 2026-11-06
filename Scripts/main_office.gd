extends Node2D
@onready var cam = $Camera2D
@onready var cam_button = $cam_button
@onready var itself = $"." 
@onready var light = $PointLight2D
@onready var layout3 = $Layout3

var parent
var open_cams

var run_once = false

var look_right = false
var look_left = false
var mouse_pos
var lights_on
var lights_off

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !run_once and itself.get_parent() != null:
		parent = itself.get_parent()
		open_cams = parent.get_child(1)
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


func _on_lights_off_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("Click"):
		if lights_on:
			light.visible = false
			lights_off = true
			lights_on = false
		else:
			light.visible = true
			lights_on = true
			lights_off = false
			
	else: pass
