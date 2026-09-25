extends Node2D
var letter: PackedScene = preload("res://letter.tscn")
var alphabet_t = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","!","?","sf","ff",]
var sts = "" # sentence to spell
var space = 20 # pixels between chars. ~60 pixels between words (space is technically a char).

func _ready() -> void:
	sts = "wanna play a game?"

func _process(delta: float) -> void:
	pass
	
func spawn_let() -> void:
	pass
