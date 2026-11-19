extends Node2D
@onready var gremlin = $Goobguy
var stage1 = true
var stage2 = false
var stage3 = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if stage1:
		$AnimationPlayer.play("Gremlin1")
		pass
	
	pass
