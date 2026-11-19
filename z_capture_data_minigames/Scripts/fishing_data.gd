extends Node2D

@onready var row_1 = $row_1
@onready var row_2 = $row_2
@onready var row_3 = $row_3
@onready var row_4 = $row_4
@onready var row_5 = $row_5

var fish_of_data_scene: PackedScene = preload("res://z_capture_data_minigames/data_fish.tscn")

# 5 rows, each row has less 'fish' in descending order. 
# 1/5 row = 30 - 35 fish
# 2/5 row = 15-20 fish
# 3/5 row = 10-12 fish
# 4/5 row = 5-7 fish
# 5/5 row = 1  SUPA FISH

var do_once = false

var row_1_fish_count: int
var row_2_fish_count: int
var row_3_fish_count: int
var row_4_fish_count: int
var row_5_fish_count: int
var fca = [] # fish count array

func _process(delta: float) -> void:
	if !do_once:
		row_1_fish_count = randi_range(17,20)
		row_2_fish_count = randi_range(12,17)
		row_3_fish_count = randi_range(7,10)
		row_4_fish_count = randi_range(2,7)
		row_5_fish_count = 1
		fca = [row_1_fish_count, row_2_fish_count, row_3_fish_count, row_4_fish_count, row_5_fish_count]
		#print(fca)
		do_once = 1
		for i in range(0, fca[0]):
			var new_data_fish = fish_of_data_scene.instantiate() as Node2D
			new_data_fish.set_limits(0, 950)
			new_data_fish.add_speed(randf_range(-50, 50.0))
			new_data_fish.global_position = Vector2(randf_range(0.0,1152.0), row_1.global_position.y)
			row_1.add_child(new_data_fish)
			var dir = randi_range(0,1)
			if dir == 0:
				dir = -1
			new_data_fish.set_dir(dir)
			new_data_fish.set_color(0)
			new_data_fish.global_position.y += randf_range(-25.0, 25.0)
			
		for i in range(0, fca[1]):
			var new_data_fish = fish_of_data_scene.instantiate() as Node2D
			new_data_fish.set_limits(0, 950)
			new_data_fish.add_speed(randf_range(-50, 26.0))
			new_data_fish.global_position = Vector2(randf_range(0.0,1152.0), row_2.global_position.y)
			row_2.add_child(new_data_fish)
			var dir = randi_range(0,1)
			if dir == 0:
				dir = -1
			new_data_fish.set_dir(dir)
			new_data_fish.set_color(1)
			new_data_fish.global_position.y += randf_range(-25.0, 25.0)
		
		for i in range(0, fca[2]):
			var new_data_fish = fish_of_data_scene.instantiate() as Node2D
			new_data_fish.set_limits(0, 950)
			new_data_fish.add_speed(randf_range(-50, 8.0))
			new_data_fish.global_position = Vector2(randf_range(0.0,1152.0),row_3.global_position.y)
			row_2.add_child(new_data_fish)
			var dir = randi_range(0,1)
			if dir == 0:
				dir = -1
			new_data_fish.set_dir(dir)
			new_data_fish.set_color(2)
			new_data_fish.global_position.y += randf_range(-25.0, 25.0)
		
		for i in range(0, fca[3]):
			var new_data_fish = fish_of_data_scene.instantiate() as Node2D
			new_data_fish.set_limits(0, 950)
			new_data_fish.add_speed(randf_range(-50, 0.0))
			new_data_fish.global_position = Vector2(randf_range(0.0,1152.0),row_4.global_position.y)
			row_2.add_child(new_data_fish)
			var dir = randi_range(0,1)
			if dir == 0:
				dir = -1
			new_data_fish.set_dir(dir)
			new_data_fish.set_color(3)
			new_data_fish.global_position.y += randf_range(-25.0, 25.0)
			
		for i in range(0, fca[3]):
			var new_data_fish = fish_of_data_scene.instantiate() as Node2D
			new_data_fish.set_limits(0, 950)
			new_data_fish.add_speed(randf_range(-50, -40))
			new_data_fish.global_position = Vector2(randf_range(0.0,1152.0),row_5.global_position.y)
			row_2.add_child(new_data_fish)
			var dir = randi_range(0,1)
			if dir == 0:
				dir = -1
			new_data_fish.set_dir(dir)
			new_data_fish.set_color(4)
			new_data_fish.global_position.y += randf_range(-10.0, 10.0)
			new_data_fish.scale = Vector2(1.5, 1.5)
			
		
