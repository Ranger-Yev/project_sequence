extends Node2D
var rng = RandomNumberGenerator.new()
@onready var letters = $letters
var letter: PackedScene = preload("res://letter.tscn")
var alphabet_t = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p",
"q","r","s","t","u","v","w","x","y","z","!","?","sf","ff"]
var alphabet_p = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p",
"q","r","s","t","u","v","w","x","y","z","1","2","3","4","5","6","7","8","9","!","?",
"/","|","@","#","$","*","(",")","'", '"', "~", "\\", "<", ">", ".", ",", "[", "]", "{",
 "}", ":", ";", "_", "-", "+", "=", " "]

# some characters are not centered due to being done in a 6x6 format before upscaling. 
# The exceptions variable keeps track of these characters and alows special actions to 
# be performed in order not to break continuity.
# all types: 0 > 3 width, shift one left | 1 > 1 width, 4th pixel |
# 2 > 5 width, shift one right | 3 > 3 width, shift one right | 4 > 2 width, paired, shift 1 left |
# 5 > 2 width, centered, remove two outer collumns | 6 > 1 width, 3rd pixel
#var alphabet_p_exceptions = {0:0, 7:1, 8:0, 9:0, 11:3, 18:0, 20:0, 21:3, 
#22:0, 23:0, 24:0, 25:0, 35:1, 37:0, 38:6, 42:3, 43:4, 44:4, 45:5, 46:3, 48:0,  
#}

var sts = "" # sentence to spell
var space = 60 # pixels between chars. ~180 pixels between words (space is technically a char).
var frame = -1
var pos = Vector2(10,100)
var luck0 = -1

func _ready() -> void:
	sts = "wanna play a game?"

func _process(delta: float) -> void:
	frame += 1
	if frame % 10 == 1:
		pos.x += 96
		var new_letter = letter.instantiate() as AnimatedSprite2D
		new_letter.global_position = pos
		letters.add_child(new_letter)

	
func spawn_let() -> void:
	pass
