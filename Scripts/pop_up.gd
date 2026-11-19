extends Sprite2D
@onready var itself = $"."

func spawn(loc: Vector2):
	itself.visible = true
	itself.global_position = loc

func _on_button_pressed() -> void:
	#print("waow, close button for ad is workie.")
	itself.queue_free()
