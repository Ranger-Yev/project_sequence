extends Node2D
@onready var letters = $letters
var letter: PackedScene = preload("res://letter.tscn")
var alphabet_t = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p",
"q","r","s","t","u","v","w","x","y","z","!","?","*sf*","*ff*"]
var alphabet_p = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p",
"q","r","s","t","u","v","w","x","y","z","1","2","3","4","5","6","7","8","9","0","!","?",
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

# var dimensions = Vector2(96, 96) # character dimensions

var sts = "" # sentence to spell
var lti = [] # letter to index - encode sts into all integer indexes
var pos = Vector2(10,100)
var index = 0

func _ready() -> void:
	sts = "wanna play a game?"
	var font = 1
	if font == 1:
		prog_index_finder()
	else:
		tinkle_index_finder()
	print(lti)
	
func _process(delta: float) -> void:
	if index < len(lti):
		spawn_let(1,lti)
	index += 1

func tinkle_index_finder():
	for i in sts:
		if i in alphabet_t:
			#print(i, " is in the tinkle_type.")
			lti.append(alphabet_t.find(i))

func prog_index_finder():
	for i in sts:
		if i in alphabet_p:
			#print(i, " is in the prog_type.")
			lti.append(alphabet_p.find(i))

func spawn_let(anim: int, lti: Array) -> void: # anim = index, let = index - 1
	for i in range(0, len(lti)):
		var let = lti[i]
		if lti[i - 1] == 64:
				pos.x += 32
		else: 
				pos.x += 96
		if lti[i] != 64:
			var new_letter = letter.instantiate() as AnimatedSprite2D
			new_letter.global_position = pos
			letters.add_child(new_letter)
			match anim:
				0: # tinkle_type
					new_letter.animation = "tinkle_type"
					#print(len(alphabet_t)) # max char 30
					if let > 30:
						print("ERROR: Index out of range - Tinkle Type only has 30 characters. Dividing and using the remainder as the index.")
						let = let % 30
				1: # prog_type
					new_letter.animation = "prog_type"
					#print(len(alphabet_p)) # max char 64
					if let > 64:
						print("ERROR: Index out of range - Prog Type only has 64 characters. Dividing and using the remainder as the index.")
						let = let % 63
			new_letter.frame = let
