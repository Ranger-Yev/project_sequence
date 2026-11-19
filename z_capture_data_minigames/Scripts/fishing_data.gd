extends Node2D

@onready var row_1 = $row_1
@onready var row_2 = $row_2
@onready var row_3 = $row_3
@onready var row_4 = $row_4
@onready var row_5 = $row_5

var fish_of_data_scene: PackedScene = preload("res://z_capture_data_minigames/data_fish.tscn")

# 5 rows, each row has less 'fish' in descending order. 
# 1/5 row = 10 - 15 fish
# 2/5 row = 5-8 fish
# 3/5 row = 4-5 fish
# 4/5 row = 2-3 fish
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
		row_1_fish_count = randi_range(10,15)
		row_2_fish_count = randi_range(5,8)
		row_3_fish_count = randi_range(4,5)
		row_4_fish_count = randi_range(2,3)
		row_5_fish_count = 1
		fca = [row_1_fish_count, row_2_fish_count, row_3_fish_count, row_4_fish_count, row_5_fish_count]
		#print(fca)
		do_once = 1
		for i in range(0, fca[0]):
			var new_data_fish = fish_of_data_scene.instantiate() as Node2D
			new_data_fish.set_limits(0, 1152)
			new_data_fish.add_speed(randf_range(5.0, 25.0))
			var r_spawn = randi_range(0,1)
			if r_spawn == 1:
				new_data_fish.global_position = row_1.global_position + Vector2(1152.0,0)
			else:
				new_data_fish.global_position = row_1.global_position
			row_1.add_child(new_data_fish)
			
		
