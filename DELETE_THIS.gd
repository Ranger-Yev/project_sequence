extends Marker2D
@onready var mark = $"."
@onready var particle = $BigDustyparticle
var parframe = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	mark.position.x -= 10
	if mark.position.x <= -500:
		mark.position.x = 0
	
	mark.position.y += 9 #18 is multiplyed to equal 1296 and 648
	if mark.position.y >= 1296:
		mark.position.y = 648
	
	particle.frame = parframe
	
	
	pass


func _on_timer_timeout() -> void:
	parframe += 1
	if parframe > 3:
		parframe = 0
	pass # Replace with function body.
