extends Node2D

@onready var Threat_Move_Timer = $"Threat Move Timer"
var chance_of_moving = 10
var room_progress = 0
var old_number
var is_night_survived = false
@onready var camera1 = $"Open Cams/Cam1"
@onready var camera2 = $"Open Cams/Cam2"
@onready var camera3 = $"Open Cams/Cam3"
@onready var camera4 = $"Open Cams/Cam4"
@onready var camera5 = $"Open Cams/Cam5"
@onready var camera6 = $"Open Cams/Cam6"
@onready var hacking_terminal = $hacking_terminal
@onready var zero_the_camera_threat = $"Open Cams/0"
@onready var zero_at_your_door = $"main_office/Zero"
@onready var night_timer = $"Night Timer"

var systems_running = 0 # number of systems currently running - for the surge/brown out feature
var game_over = false
var run_once = 0

func _process(delta: float) -> void:
	if night_timer.is_stopped():
		is_night_survived = true
	
	
	if !run_once:
		run_once += 1

func _on_threat_move_timer_timeout() -> void:
	old_number = room_progress
	
	if room_progress <= 0:
		if randi_range(0,100) <= 10:
			room_progress = 1
	if room_progress == 1:
		if randi_range(0,100) <= 10:
			room_progress = 2
	if room_progress == 2:
		if randi_range(0,100) <= 10:
			room_progress = 3
	if room_progress == 3:
		if randi_range(0,100) <= 10:
			room_progress = 4
	if room_progress == 4:
		if randi_range(0,100) <= 10:
			room_progress = 5
	if room_progress == 5:
		if randi_range(0,100) <= 10:
			room_progress = 6
	if room_progress == 6:
		if randi_range(0,100) <= 10:
			room_progress = 7
	if room_progress == 7:
		zero_at_your_door.visible = true
		if randi_range(0,100) <= 10:
			game_over = true
	
	
	
	
	if room_progress != old_number:
		if room_progress == 0:
			zero_the_camera_threat.position = Vector2(600,400)
		if room_progress == 1:
			zero_the_camera_threat.position = Vector2(1500,550)
		if room_progress == 2:
			zero_the_camera_threat.position = Vector2(3150,400)
		if room_progress == 3:
			zero_the_camera_threat.position = Vector2(4000,550)
		if room_progress == 4:
			zero_the_camera_threat.position = Vector2(4900,250)
		if room_progress == 5:
			zero_the_camera_threat.position = Vector2(6400,300)
		if room_progress == 6:
			pass
	

	
	pass


#
#
#
#
#
#
	
func round_to_dec(num, digit: int):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)
	
