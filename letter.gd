extends AnimatedSprite2D
@onready var itself = $"."

func set_color(c: Color):
	itself.modulate = c
	
func get_let():
	return itself.frame
	
func set_let(i: int):
	itself.frame = i
