extends Node2D
@onready var letters = $letters
var letter: PackedScene = preload("res://letter.tscn")
var alphabet_t = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p",
"q","r","s","t","u","v","w","x","y","z","!","?","*sf*","*ff*"," "]

var alphabet_p = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p",
"q","r","s","t","u","v","w","x","y","z","1","2","3","4","5","6","7","8","9","0","!","?",
"/","|","@","#","$","*","(",")","'", '"', "~", "\\", "<", ">", ".", ",", "[", "]", "{",
 "}", ":", ";", "_", "-", "+", "=", " "]

var p_1w_1l = [39, 58, 59] # 1 width, one to left
# |, :, ;
var p_1w_1r = [36] # 1 width, one to right
# !
var p_1w_2l = [52, 53] # 1 width, two to left
# ., ,
var p_2w = [46] # 2 width, center
# ' 
var p_2w_1l = [44, 54] # 2 width, one to left
# (, [
var p_2w_1r = [45, 55] # 2 width, one to right
# ), ]
var p_3w_1l = [0, 9, 10, 19, 21, 23, 24, 25, 26, 38, 50, 62] # 3 width, one to left
# a, j, k, t, v, x, y, z, 1, /, <, +
var p_3w_1r = [8, 43, 47, 51] # 3 width, one to right
# i, *, ", >
var p_3w_2l = [56] # 3 width, two to left
# {
var p_3w_2r = [57] # 3 width, two to right
# }
var p_5w_1l = [40, 41, 42] # 5 width, one to left
# @, #, $
var p_5w_1r = [12, 22] # 5 width, one to right
# m, w n

var alphabet_p_special_chars = [[p_1w_1l, p_1w_1r, p_1w_2l], [p_2w, p_2w_1l, p_2w_1r], [p_3w_1l, p_3w_1r, p_3w_2l, p_3w_2r], [p_5w_1l, p_5w_1r]]
# legend -> 0 >>> 1 width, 1 >>> 2 width, 2 >>> 3 width, 3 >>> 5 width
# 0 - 0[0] >>> 1 left, 0[1] >>> 1 right, 0[2] >>> 2 left
# 1 - 1[0] >>> center, 1[1] >>> 1 left, 1[2] >>> 1 right
# 2 - 2[0] >>> 1 left, 2[1] >>> 1 right, 2[2] >>> 2 left, 2[3] >>> 2 right
# 3 - 3[0] >>> 1 left, 3[1] >>> 1 right
var letters_hidden = false

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

func hide_unhide(state: bool) -> void:
	letters_hidden = state
	if letters_hidden:
		letters.set_visible(0)
	else:
		letters.set_visible(1)

func get_visibility() -> bool:
	return letters_hidden

func is_special_character(int_char: int) -> Array:
	# legend -> 0 >>> 1 width, 1 >>> 2 width, 2 >>> 3 width, 4 >>> 5 width, 5 >>> 6 width
	# 0 - 0[0] >>> 1 left, 0[1] >>> 1 right, 0[2] >>> 2 left
	# 1 - 1[0] >>> center, 1[1] >>> 1 left, 1[2] >>> 1 right
	# 2 - 2[0] >>> 1 left, 2[1] >>> 1 right, 2[2] >>> 2 left, 2[3] >>> 2 right
	# 3 - 3[0] >>> 1 left, 3[1] >>> 1 right
	if int_char in alphabet_p_special_chars[0][0]:
		return [0, 0] 
	elif int_char in alphabet_p_special_chars[0][1]:
		return [0, 1] # right
	elif int_char in alphabet_p_special_chars[0][2]:
		return [0, 2]
	elif int_char in alphabet_p_special_chars[1][0]:
		return [1, 0]
	elif int_char in alphabet_p_special_chars[1][1]:
		return [1, 1]
	elif int_char in alphabet_p_special_chars[1][2]:
		return [1, 2] # right
	elif int_char in alphabet_p_special_chars[2][0]:
		return [2, 0]
	elif int_char in alphabet_p_special_chars[2][1]:
		return [2, 1] # right
	elif int_char in alphabet_p_special_chars[2][2]:
		return [2, 2]
	elif int_char in alphabet_p_special_chars[2][3]:
		return [2, 3] # right
	elif int_char in alphabet_p_special_chars[3][0]:
		return [3, 0]
	elif int_char in alphabet_p_special_chars[3][1]:
		return [3, 1] # right
	
	return [-1]

func spawn_let(font: int, str_to_convert: String, size: float, start_pos: Vector2, color: Color) -> void: # font = index of font, let = index - 1
	var pos = start_pos
	var arr = []
	for i in str_to_convert: # lowercase everything
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
		if arr[i] == 412: # if element at index i is 412, then treat it as a line break / new line.
			pos = Vector2(start_pos.x, pos.y)
			pos.y += 10
			pos.x -= 16 * size
		elif font == 1 and alphabet_p[arr[i] % 64] == " " or font == 0 and alphabet_t[arr[i] % 31] == " ": 
			# if element of the alphabet at index i % length of alphabet is space (" ") then treat is a space
			pos.x += 64 * size
		else:
			pos.x += 96 * size # standard position mod
			if font == 1 and (is_special_character(arr[i - 1]) != [-1] or is_special_character(arr[i]) != [-1]): # special character
				var special_instruction = is_special_character(arr[i - 1])
				match special_instruction:
					# legend -> 0 >>> 1 width, 1 >>> 2 width, 2 >>> 3 width, 3 >>> 5 width
					# -1 - NO MODIFICATION
					# 0 - 0[0] >>> 1 left, 0[1] >>> 1 right, 0[2] >>> 2 left
					# 1 - 1[0] >>> center, 1[1] >>> 1 left, 1[2] >>> 1 right
					# 2 - 2[0] >>> 1 left, 2[1] >>> 1 right, 2[2] >>> 2 left, 2[3] >>> 2 right
					# 3 - 3[0] >>> 1 left, 3[1] >>> 1 right
					[0, 0]: # 1 width, 1 left
						pos.x -= (16 * 3) * size
					[0, 2]: # 1 width, 2 left
						pos.x -= (16 * 4) * size
					[1, 0]: # 2 width, center
						pos.x = pos.x
					[1, 1]: # 2 width, 1 left
						pos.x -= 16 * size
					[2, 0]: # 3 width, 1 left
						pos.x -= (16 * 1) * size
					[2, 2]: # 3 width, 2 left
						pos.x -= (16 * 3) * size
					[3, 0]: # 5 width, 1 left
						pos.x -= 16 * size
						
				special_instruction = is_special_character(arr[i])
				match special_instruction:
					[0, 1]: # 1 width, 1 right
						pos.x -= (16 * 3) * size
					[1, 2]: # 2 width, 1 right
						pos.x -= 16 * size
					[2, 1]: # 3 width, 1 right
						pos.x -= 16 * size
					[2, 3]: # 3 width, 2 right
						pos.x -= (16 * 2) * size
					[3, 1]: # 5 width, 1 right
						pos.x -= 16 * size
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
						let = let % 31
				1: # prog_type
					#print(len(alphabet_p)) # max char 64
					if let > 64:
						print("ERROR: Index out of range - Prog Type only has 64 characters. Dividing and using the remainder as the index.")
						let = let % 63
			new_letter.frame = let
			var new_scale = size * Vector2(1,1)
			new_letter.scale = new_scale
			new_letter.modulate = color
