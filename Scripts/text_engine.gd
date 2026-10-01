extends Node2D
@onready var letters = $letters
var letter: PackedScene = preload("res://letter.tscn")
var alphabet_t = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p",
"q","r","s","t","u","v","w","x","y","z","!","?","*sf*","*ff*"," "]
var alphabet_p = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p",
"q","r","s","t","u","v","w","x","y","z","1","2","3","4","5","6","7","8","9","0","!","?",
"/","|","@","#","$","*","(",")","'", '"', "~", "\\", "<", ">", ".", ",", "[", "]", "{",
 "}", ":", ";", "_", "-", "+", "=", " "]

# var dimensions = Vector2(96, 96) # character dimensions

func tinkle_index_finder(arr: Array) -> Array:
	var lti = [] # letter to index - encode sts into all integer indexes
	for i in range(0,len(arr)):
		if arr[i] in alphabet_t:
			#print(i, " is in the tinkle_type.")
			lti.append(alphabet_t.find(arr[i]))
		elif arr[i] == "*" and arr[i + 1] == "*":
			lti.append(412)
	return lti

func prog_index_finder(arr: Array) -> Array:
	var lti = [] # letter to index - encode sts into all integer indexes
	for i in range(0,len(arr)):
		if arr[i] == "&":
			lti.append(412)
		elif arr[i] in alphabet_p:
			#print(i, " is in the prog_type.")
			lti.append(alphabet_p.find(arr[i]))
	return lti

func spawn_let(font: int, str_to_convert: String, size: float, start_pos: Vector2) -> void: # font = index of font, let = index - 1
	var pos = start_pos
	var arr = []
	for i in str_to_convert:
		arr.append(i.to_lower())
	var font_name = ""
	if font == 0:
		font_name = "tinkle_type"
		arr = tinkle_index_finder(arr)
	elif font == 1:
		font_name = "prog_type"
		arr = prog_index_finder(arr)
	#print(arr)
	for i in range(0, len(arr)):
		if arr[i] == 412:
			pos = start_pos + Vector2(0, 10)
		elif alphabet_p[arr[i] % 64] == " " or alphabet_t[arr[i] % 30] == " ":
			pos.x += 64 * size
		else:
			pos.x += 96 * size
			var let = arr[i]
			var new_letter = letter.instantiate() as AnimatedSprite2D
			new_letter.global_position = pos
			letters.add_child(new_letter)
			new_letter.animation = font_name
			match font: # error handling (if index of character too big, divide and use remainder as index
				0: # tinkle_type
					#print(len(alphabet_t)) # max char 30
					if let > 30:
						print("ERROR: Index out of range - Tinkle Type only has 30 characters. Dividing and using the remainder as the index.")
						let = let % 30
				1: # prog_type
					#print(len(alphabet_p)) # max char 64
					if let > 64:
						print("ERROR: Index out of range - Prog Type only has 64 characters. Dividing and using the remainder as the index.")
						let = let % 63
			new_letter.frame = let
			var new_scale = size * Vector2(1,1)
			new_letter.scale = new_scale
