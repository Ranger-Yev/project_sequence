extends Node2D
var rng = RandomNumberGenerator.new()
@onready var letters = $letters
var letter: PackedScene = preload("res://letter.tscn")
var alphabet_t = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p",
"q","r","s","t","u","v","w","x","y","z","!","?","sf","ff"]
var alphabet_p = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p",
"q","r","s","t","u","v","w","x","y","z","1","2","3","4","5","6","7","8","9","!","?","/","|","@","#","$","*","(",")","'"]
var sts = "" # sentence to spell
var space = 60 # pixels between chars. ~60 pixels between words (space is technically a char).
var frame = -1
var pos = Vector2(10,100)

func _ready() -> void:
	sts = "wanna play a game?"

func _process(delta: float) -> void:
	frame += 1
	if frame % 10 == 1:
		var new_letter = letter.instantiate() as AnimatedSprite2D
		new_letter.global_position = Vector2(pos.x * frame, pos.y)
		letters.add_child(new_letter)
		var luck = rng.randi_range(0,1)
		if luck == 1:
			luck = rng.randi_range(0,29)
		else:
			luck = rng.randi_range(0,64)
		
		
		new_letter.set_let(luck)
	
func spawn_let() -> void:
	pass
