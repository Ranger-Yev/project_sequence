extends Sprite2D
@onready var itself = $"."
@onready var parent = null
var button_pressed = false

func _process(_delta: float) -> void:
	if itself.get_parent() != null:
		parent = itself.get_parent()
	
func spawn(loc: Vector2):
	itself.visible = true
	itself.global_position = loc

func _on_button_pressed() -> void:
	#print("waow, close button for ad is workie.")
	button_pressed = true

func get_button_status():
	return button_pressed
	
