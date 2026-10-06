extends Node2D
var cam_go_right = true
var cam_go_left = false
@onready var cam_pause = $"Cam pawse x3"
@onready var cam = $Camera2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	print(cam.position.x)
	if cam_go_right:
		if cam_pause.time_left != 0:
			return
		if cam.position.x >= 192:
			cam_go_left = true
			cam_go_right = false
			cam_pause.start()
		cam.position.x += 50*delta
		
	if cam_go_left:
		if cam_pause.time_left != 0:
			return
		if cam.position.x <= 0:
			cam_go_right = true
			cam_go_left = false
			cam_pause.start()
		cam.position.x -= 50*delta
		
	pass

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_office.tscn")
	pass # Replace with function body.
