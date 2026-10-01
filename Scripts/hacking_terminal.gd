extends Node2D
@onready var text_engine = $text_engine
@onready var camera = $Camera2D
@onready var start_position = $start_of_terminal.global_position + Vector2(0,5)
var to_do = 0
var sts = "guest@tinkle-tboard-t415e-wifi1:~$ cd Documents/&guest@tinkle-tboard-t415e-wifi1:~$ ls"
var cur_zoom = Vector2(1,1)


func _process(_delta: float) -> void:
	if to_do == 0:
		text_engine.spawn_let(1, sts, 0.0625, start_position)
		to_do += 1
	
	if Input.is_action_just_pressed("Scroll_Up") and not cur_zoom > Vector2(6,6):
		cur_zoom += Vector2(0.1, 0.1)
	if  Input.is_action_just_pressed("Scroll_Down") and not cur_zoom < Vector2(0.5,0.5):
		cur_zoom -= Vector2(0.1, 0.1)
	camera.zoom = cur_zoom
