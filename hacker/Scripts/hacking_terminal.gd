extends Node2D

# TO DO -> CHANGE hackers.get_children()[0] INTO A GODDAMN VARIABLE YOU LAZY SLUG //performance reasons (not that it affects it too much but it's nice to be efficient).+

var hacker_scene: PackedScene = preload("res://hacker/hacker.tscn")

@onready var itself = $"."
@onready var hackers = $hackers
@onready var hacker_spawner_timer = $hacker_spawn_timer
@onready var letters = $text_engine/letters
@onready var text_engine = $text_engine
@onready var camera = $Camera2D
@onready var start_position = $start_of_terminal.position + Vector2(0,5)
var color =  Color(1.0, 0.718, 0.0, 1.0)
var ter_std_interface = "yevhenii@yevhenii-B550-EAGLE-WIFI6:~$ " # terminal standard interface
var ter_hack_det = "hackerAlarm -> NEW BREACH DETECTED&" # terminal hacker detected
var ter_rep_hack_str_list = ["hackerAlarm -> found ", " intruders!!!&"] # terminal report for hackers string
var ter_rep_data_str_list = ["dataReport -> currently ", " data left.&"] # terminal report for data string
var ter_out = "" # output to terminal

var data = 100.0
var num_of_hackers = 0
var has_hacker = false
var hacker_alarm_color = Color(0.693, 0.027, 0.085, 1.0)

var run_once = false
var parent
var main_office
var main_office_cam
var test
#@onready var test_phase_timer = $test_switcher
#var test_string = "guest@tinkle-tboard-t415e-wifi1:~$ hackerAlarm -> NEW BREACH DETECTED&guest@tinkle-tboard-t415e-wifi1:~$ hackerAlarm -> found x intruders!!!&"
#var test_phase = 0

func _process(_delta: float) -> void:
	if !run_once and itself.parent != null:
		test = $"./../main_office/Camera2D"
		parent = itself.get_parent()
		if parent.name == "Game_Big":
			main_office = parent.find("main_office")
			main_office_cam = main_office.find("Camera2D")
		run_once = true
		print(test.name)
	
	#print(hackers.get_child_count() < 4)
	#print(data)
	text_engine.clear_all_loaded()
	#spawn_let(font, string to generate, size (0.0625 is 6x6, 1 is 96x96), start position, color)
	ter_out = ter_std_interface + ter_rep_hack_str_list[0] + str(num_of_hackers) + ter_rep_hack_str_list[1]
	ter_out += ter_std_interface + ter_rep_data_str_list[0] + str(data) + ter_rep_data_str_list[1]
	#print(str(hackers.get_child_count()))
	text_engine.spawn_let(1, ter_out, 0.0625, start_position, color)
	
	#if test_phase_timer.is_stopped():
		#test_phase_timer.start()
	
	if hacker_spawner_timer.is_stopped() and !has_hacker:
		hacker_spawner_timer.start()
		
	if !(hackers.get_children() == []):
		has_hacker = true
		data = hackers.get_children()[0].get_data()
		num_of_hackers = hackers.get_children()[0].get_num_hackers()
		#print(hackers.get_children())
	else:
		has_hacker = false
		if hackers.get_children() != []:
			hackers.get_children()[0].set_num_hackers(1)
		
	if Input.is_action_just_pressed("S"):
		hackers.get_children()[0].set_num_hackers(hackers.get_children()[0].get_num_hackers() - 1)


func text_hide_unhide(): # might be a bad name, not sure what else to call it though
	var is_letters_vis = text_engine.get_visibility()
	if is_letters_vis:
		text_engine.hide_unhide(0)
	else:
		text_engine.hide_unhide(1)

#hacker enemies
func _on_hacker_spawn_timer_timeout() -> void:
	var random = randi_range(1,100)
	if hackers.get_children() == [] and !has_hacker and random > 75:
		#print("hacker spwned!")
		var hacker_new_instance = hacker_scene.instantiate() as Node2D
		hackers.add_child(hacker_new_instance)
	elif hackers.get_children() != [] and !has_hacker:
		hackers.get_children()[0].set_num_hackers(1)

func round_to_dec(num, digit: int):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)

func get_data():
	return data

func set_data(new_data: float):
	data = new_data

#func _on_test_switcher_timeout() -> void:
	#if test_phase == 0:
		#test_string = 'guest@tinkle-tboard-t415e-wifi1:~$ cat letter.tscn
		#&extends AnimatedSprite2D
		#&
		#&@onready var itself = $"."
		#&
		#&func set_color(c: Color):
		#&    itself.modulate = c
		#&func get_let():
		#&    return itself.frame
		#&
		#&func set_let(i: int):
		#&    itself.set_frame(i)
		#'
		#test_phase = 1
	#else:
		#test_string = 'Secondary test string'
		#test_phase = 0
