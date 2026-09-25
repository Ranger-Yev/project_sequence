extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Icon.position = $"M1".position
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	# Up
	if Input.is_action_just_pressed("ui_down"):
		if $"Icon".position == $"M1".position:
			$"Icon".position = $"M2".position
		elif $"Icon".position == $"M2".position:
			$"Icon".position = $"M3".position
		else: 
			pass
		
	# Down
	if Input.is_action_just_pressed("ui_up"):
		if $"Icon".position == $"M3".position:
			$"Icon".position = $"M2".position
		elif $"Icon".position == $"M2".position:
			$"Icon".position = $"M1".position
		else: 
			pass
	
	if Input.is_action_just_pressed("ui_accept"):
		if $"Icon".position == $"M1".position:
			print("Started the game")
		elif $"Icon".position == $"M2".position:
			pass
		else: queue_free()
	
	pass
