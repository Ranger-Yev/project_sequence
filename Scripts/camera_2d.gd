extends Camera2D

@onready var itself = $"."
const SPEED = 1000
@export var debug_mode = false
var cur_zoom = Vector2(1.921,1.8)

func _process(delta: float) -> void:
	if debug_mode:
		var dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		itself.global_position += SPEED * dir * delta
		
		if Input.is_action_just_pressed("Scroll_Up") and not cur_zoom > Vector2(5.5,5.5):
			cur_zoom += Vector2(0.5, 0.5)
			#print("ZOOOM")
		if  Input.is_action_just_pressed("Scroll_Down") and not cur_zoom < Vector2(0.5,0.5):
			cur_zoom -= Vector2(0.5, 0.5)
			#print("UNZOOOM")
		if cur_zoom <= Vector2.ZERO:
			cur_zoom = Vector2(0.5,0.5)
		#print(cur_zoom)
		itself.zoom = cur_zoom
