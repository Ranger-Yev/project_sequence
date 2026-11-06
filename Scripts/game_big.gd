extends Node2D

@onready var Threat_Move_Timer = $"Threat Move Timer"
var chance_of_moving = 10
var room_progress = 0
@onready var camera1 = $"Open Cams/Cam1"
@onready var camera2 = $"Open Cams/Cam2"
@onready var camera3 = $"Open Cams/Cam3"
@onready var camera4 = $"Open Cams/Cam4"
@onready var camera5 = $"Open Cams/Cam5"
@onready var camera6 = $"Open Cams/Cam6"
# Called when the node enters the scene tree for the first time.
func _process(delta: float) -> void:
	
	
	pass


func _on_threat_move_timer_timeout() -> void:
	if chance_of_moving >= randi_range(0,100):
		room_progress += 1
		chance_of_moving = 10*room_progress
	else:
		chance_of_moving += 5
	pass 
	
	if room_progress == 1:
		camera1.frame = 2
		_all_exept_cam1()
	elif room_progress == 2:
		camera2.frame = 1
		_all_exept_cam2()
	elif room_progress == 3:
		camera3.frame = 1
		_all_exept_cam3()
	elif room_progress == 4:
		camera4.frame = 1
		_all_exept_cam4()
	elif room_progress == 5:
		camera5.frame = 1
		_all_exept_cam5()
	elif room_progress == 6:
		camera6.frame = 1
		_all_exept_cam6()
	else:
		$"Open Cams".visible = false
		$main_office.visible = false
		print("This feeling...        It Is When You Would Die")
	
	
	
	### THESE FUNCTIONS ARE A WORKAROUND TO CHANGING THE FRAMES CORRECTLY WITHOUT HAVING UGLY MESSY CODE IN EVERY SINGLE IF AND ELSE IF STATMENT ###
func _all_exept_cam1():
	camera2.frame = 0
	camera3.frame = 0
	camera4.frame = 0
	camera5.frame = 0
	camera6.frame = 0
func _all_exept_cam2():
	camera1.frame = 0
	camera3.frame = 0
	camera4.frame = 0
	camera5.frame = 0
	camera6.frame = 0
func _all_exept_cam3():
	camera1.frame = 0
	camera2.frame = 0
	camera4.frame = 0
	camera5.frame = 0
	camera6.frame = 0
func _all_exept_cam4():
	camera1.frame = 0
	camera2.frame = 0
	camera3.frame = 0
	camera5.frame = 0
	camera6.frame = 0
func _all_exept_cam5():
	camera1.frame = 0
	camera2.frame = 0
	camera3.frame = 0
	camera4.frame = 0
	camera6.frame = 0
func _all_exept_cam6():
	camera1.frame = 0
	camera2.frame = 0
	camera3.frame = 0
	camera4.frame = 0
	camera5.frame = 0
