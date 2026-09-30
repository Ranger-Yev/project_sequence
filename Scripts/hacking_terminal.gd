extends Node2D
@onready var text_engine = $text_engine
var to_do = 0
var sts = "DIE DIE DIE DIE"

func _process(_delta: float) -> void:
	if to_do == 0:
		text_engine.spawn_let(1, sts)
		to_do += 1
