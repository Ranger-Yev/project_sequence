extends Node2D
@onready var letters = $text_engine/letters
@onready var text_engine = $text_engine
@onready var camera = $Camera2D
@onready var start_position = $start_of_terminal.global_position + Vector2(0,5)
var to_do = 0
var sts = "guest@tinkle-tboard-t415e-wifi1:~$ "
var color =  Color(0.978, 0.667, 0.521, 1.0)

var cur_zoom = Vector2(1,1)


func _process(_delta: float) -> void:
	if to_do == 0:
		#sts = "Test for tinkle tewxt"
		# spawn_let(font, string to generate, size (0.0625 is 6x6, 1 is 96x96), start position) 
		text_engine.spawn_let(1, sts, 0.0625, start_position, color)
		#for i in range(35, len(letters.get_children)):
			#pass
		to_do += 1
	
	if Input.is_action_just_pressed("Scroll_Up") and not cur_zoom > Vector2(5.5,5.5):
		cur_zoom += Vector2(0.5, 0.5)
	if  Input.is_action_just_pressed("Scroll_Down") and not cur_zoom < Vector2(0.5,0.5):
		cur_zoom -= Vector2(0.5, 0.5)
	if cur_zoom <= Vector2.ZERO:
		cur_zoom = Vector2(0.5,0.5)
	#print(cur_zoom)
	camera.zoom = cur_zoom	

func pull_up_monitor():
	var is_letters_vis = text_engine.get_visibility()
	if is_letters_vis:
		text_engine.hide_unhide(0)
	else:
		text_engine.hide_unhide(1)
