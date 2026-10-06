extends Node2D

var look_right = false
var look_left = false
var mouse_pos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	mouse_pos = get_local_mouse_position()
	
	if $Camera2D.position.x <= -1:
		pass
	elif look_left:
		$Camera2D.position.x -= 500*delta
	if $Camera2D.position.x >= 96:
		pass
	elif look_right:
		$Camera2D.position.x += 500*delta
	else:
		pass
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
