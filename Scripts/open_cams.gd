extends Node2D
var cam_go_right = true
var cam_go_left = false
var mouse_pos_cams
var current_camera_number = 0
var actual_current_camera
var cam_size_number = 1152
@onready var cam_light = $PointLight2D
@onready var cam_pause = $"Cam pawse x3"
@onready var cam = $Camera2D
@onready var cam_selector = $Camera2D/CamsSelector


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	actual_current_camera = current_camera_number * cam_size_number
	cam.position.x = actual_current_camera
	#if cam_go_right:
		#if cam_pause.time_left != 0:
			#return
		#if cam.position.x >= actual_current_camera + 220:
			#cam_go_left = true
			#cam_go_right = false
			#cam_pause.start()
		#cam.position.x += 50*delta
		#
	#if cam_go_left:
		#if cam_pause.time_left != 0:
			#return
		#if cam.position.x <= actual_current_camera:
			#cam_go_right = true
			#cam_go_left = false
			#cam_pause.start()
		#cam.position.x -= 50*delta
		
	pass

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_office.tscn")
	pass 


func _on_cam_1_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("Click"):
		cam_selector.frame = 1
		current_camera_number = 0
func _on_cam_2_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("Click"):
		cam_selector.frame = 2
		current_camera_number = 1
func _on_cam_3_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("Click"):
		cam_selector.frame = 3
		current_camera_number = 2
func _on_cam_4_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("Click"):
		cam_selector.frame = 4
		current_camera_number = 3
func _on_cam_5_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("Click"):
		cam_selector.frame = 5
		current_camera_number = 4
func _on_cam_6_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("Click"):
		cam_selector.frame = 6
		current_camera_number = 5
func _on_cam_7_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("Click"):
		cam_selector.frame = 7
		current_camera_number = 6
func _on_cam_8_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("Click"):
		cam_selector.frame = 8
		current_camera_number = 7
func _on_cam_9_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("Click"):
		cam_selector.frame = 9
		current_camera_number = 8
func _on_cam_10_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("Click"):
		cam_selector.frame = 10
		current_camera_number = 9
func _on_cam_11_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("Click"):
		cam_selector.frame = 11
		current_camera_number = 10
func _on_cam_12_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("Click"):
		cam_selector.frame = 12
		current_camera_number = 11
func _on_cam_13_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("Click"):
		cam_selector.frame = 13
		current_camera_number = 12
func _on_cam_14_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("Click"):
		cam_selector.frame = 14
		current_camera_number = 13
func _on_cam_15_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("Click"):
		cam_selector.frame = 15
		current_camera_number = 14
