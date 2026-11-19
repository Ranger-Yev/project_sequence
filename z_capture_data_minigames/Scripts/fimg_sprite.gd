extends Node2D

var not_imposter_texture = preload("res://Art/icon.svg")
var imposter_texture = preload("res://Art/imposter_sprite.png")

@onready var itself = $"."
var loc_pos = Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	loc_pos = itself.position
