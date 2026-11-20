extends Node2D

@onready var all_rows = $rows.get_children()
@onready var row_1 = $rows/row_1
@onready var row_2 = $rows/row_2
@onready var row_3 = $rows/row_3
@onready var row_4 = $rows/row_4
@onready var row_5 = $rows/row_5
@onready var rod = $data_rod

var fish_of_data_scene: PackedScene = preload("res://z_capture_data_minigames/fishing_minigame/data_fish.tscn")

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

var stop_all = false
var value = 0

func _process(_delta: float) -> void:
	if !do_once:
		rod.set_limit(520.0)
		row_1_fish_count = randi_range(7,12)
		row_2_fish_count = randi_range(6,10)
		row_3_fish_count = randi_range(2,4)
		row_4_fish_count = randi_range(1,3)
		row_5_fish_count = 1
		fca = [row_1_fish_count, row_2_fish_count, row_3_fish_count, row_4_fish_count, row_5_fish_count]
		#print(fca)
		do_once = 1
		for i in range(0, fca[0]):
			var new_data_fish = fish_of_data_scene.instantiate() as Node2D
			new_data_fish.set_limits(0.0, 950.0)
			new_data_fish.add_speed(randf_range(-50, 50.0))
			new_data_fish.global_position = Vector2(randf_range(0.0,1152.0), row_1.global_position.y)
			row_1.add_child(new_data_fish)
			var dir = randi_range(0,1)
			if dir == 0:
				dir = -1
			new_data_fish.set_dir(dir)
			new_data_fish.set_color(0)
			new_data_fish.global_position.y += randf_range(-25.0, 25.0)
			new_data_fish.set_value(0)
			
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
			new_data_fish.set_value(1)
		
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
			new_data_fish.set_value(2)
		
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
			new_data_fish.set_value(3)
			
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
			new_data_fish.set_value(4)
	
	if !stop_all:
		for row in all_rows:
			for fish in row.get_children():
				if fish.get_stop() == true:
					stop_all = true
					#print("FISH STOP, ABORT ABORT ABORT")
	else:
		for row in all_rows:
			for fish in row.get_children():
				fish.stop_this_fish()
		value = rod.get_value_of_rod()
		print(value)
