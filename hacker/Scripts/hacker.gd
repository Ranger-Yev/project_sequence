extends Node2D
@onready var itself = $"."
@onready var spt = $spawn_pts_timer # Spawn points timer
@onready var dlt = $data_loss_timer # Data loss timer
@onready var pop_ups = $pop_ups # node to store all pop-ups in
@onready var hsfrtt = $hacker_spawner_fr_this_time # hacker spawner fr this time
@onready var parent = null
@onready var pap = null # parent of parent (hacking terminal should be default)

var pop_up_scene = preload("res://pop_up.tscn")
var phase = 0 # 0 == <<PREVENTATIVE or BREACHING>>, 1 == <<CORRECTIVE or HACKED>>, 2 <<OFFENSIVE or RETURN_TO_SENDER>>
# 0 focuses on stopping hackers from even getting into the system, 
# 1 on getting the ones who already broke in out of the system, 
# and 2 on going into the hacker's systems to steal the info back
var hacker_spawn_points = 0
@export var debug_mode = false # whether or not the parent node sets up local variables or not. 
# If set to true the local independent variables will be set by the export value
@export var spawn_points_modifier = 1.0
@export var spawn_points_per_tick = 100
@export var difficulty = 1
@export var data_loss_pts_threshold = 1000.0
@export var number_of_hackers = 1
var data = 100
var data_loss = 0
var check_for_parents = 0
var run_once = false

func _process(_delta: float) -> void:
	if !check_for_parents and itself.get_parent().name == "hackers":
		parent = itself.get_parent()
		pap = parent.get_parent()
			
		check_for_parents = 1
	if parent != null:
		if !run_once and !debug_mode:
			pass
		if spt.is_stopped():
			spt.start()
		if dlt.is_stopped():
			#print("HACKER IS IN THE BASE")
			dlt.start()
		if number_of_hackers < 4 and hsfrtt.is_stopped():
			hsfrtt.start()
	else:
		print("No parent found, shutting down.")
	
		
func _on_spawn_pts_timer_timeout() -> void:
	if phase == 0:
		#print(hacker_spawn_points)
		hacker_spawn_points += spawn_points_per_tick * spawn_points_modifier
		if hacker_spawn_points > 15000:
			#print("New hacker!!!")
			phase = 1
			spawn_points_modifier *= 2.0
			hacker_spawn_points = 0
	elif phase == 1:
		var chance = randi_range(1,601)
		#print(chance)
		if chance in range(579, 580 + difficulty):
			var new_pop_up = pop_up_scene.instantiate() as Sprite2D
			pop_ups.add_child(new_pop_up)
			var random_loc = Vector2(randi_range(-500, 100), randi_range(-128,550))
			new_pop_up.spawn(random_loc)

func _on_data_loss_timer_timeout() -> void:
	if phase == 1 and parent != null:
		hacker_spawn_points += spawn_points_per_tick * spawn_points_modifier
		#print("Phase 2 (1) -> ", hacker_spawn_points)
		#print(hacker_spawn_points >= (data_loss_pts_threshold - (difficulty * 10)))
		if hacker_spawn_points >= (data_loss_pts_threshold - (difficulty * 10)):
			data = pap.get_data()
			#print(data)
			if data > 30.0:
				data_loss = (data / 30) * ((difficulty * 0.1) + 1)
				#if number_of_hackers > 1: # Modifies data loss by num of hackers
					#data_loss *= (number_of_hackers * 0.75)
				#print("Above 30.0 ", data_loss)
				data_loss = pap.round_to_dec(data_loss,2)
				data -= data_loss
				pap.round_to_dec(data, 2)
				pap.set_data(data)
			elif data < 30.0 and data > 1.0:
				data_loss = (data / 40) * ((difficulty * 0.1) + 1)
				#if number_of_hackers > 1: # Modifies data loss by num of hackers
					#data_loss *= (number_of_hackers * 0.5)
				#print("Below 30.0 and above 0.0 ", data_loss)
				data_loss = pap.round_to_dec(data_loss,2)
				data -= data_loss
				pap.round_to_dec(data, 2)
				pap.set_data(data)
			elif data < 1.0:
				data = 0.0
				pap.set_data(data)
			hacker_spawn_points = 0.0
				

func get_data() -> float:
	return data

func set_phase(new_phase: int): # new_phase == 0 or 1 or 2
	if new_phase > -1 and new_phase < 3:
		phase = new_phase
	else:
		print("new_phase is outside the possible range for hacker phase. Setting phase to default  (0)")
		phase = 0

func get_num_hackers() -> int:
	return number_of_hackers

func set_num_hackers(new_hackers: int):
	number_of_hackers = new_hackers

func _on_hacker_spawner_fr_this_time_timeout() -> void:
	var random = randi_range(1,101)
	if number_of_hackers < 4 and random > 99:
		number_of_hackers += 1

#HACKING SIDE-TERMINAL{
#!!!Hackers >>> Old security systems have made the base vulnerable. You have a side monitor set up to 
#only show the hackers’ progress. Most are bumbling idiots or infighting morons. Some hackers will be 
#emphasized in some way that makes them unique. These are dangerous ones. They deplete data over time. 
#If not dealt with quickly they accumulate an make the data loss faster and make pop ups appear faster.
#!!!Pop-ups >>> If at least one hacker is in the system, pop-ups will start appearing. 
#They block portions of the hacking terminal but can be closed to make it visible again.
#!!!Data >>> Over time hackers will extract some data. Doing completely optional minigames will get some back. 
#Be sure not to lose too much or you might have to do over time to get it back. 
#Minigames will include building your firewall, etc, etc…

#Hackers start in the <<Breaching or Preventative>> (the phase for the player). 
#In this phase the guard will have to use preventative measures to stop them from breaking into the system. 
#Hackers will start adding up points every x [0.2s] amount of time. Do minigames that will slow down hacker 
#accumulation of hacker points (modifier goes down + loses some already accumulated points). There can be multiple hackers up to a maximum number that’s not decided yet.

#Once a timer reaches some decided upon number which will then spawn in an actual 
#hacker inside the hacker terminal.

#This starts the <<Hacked or Corrective>> phase. In this phase the hackers will do 2 things. 
#First and foremost, they will steal a percentage of your total data/data-integrity. 
#The number of hackers will affect drain-rate but I’m unsure on whether or not I want each hacker 
#to steal a fixed amount or have an equation figure out drain rate based on number of hackers. 
#You will have to stay overtime if that number goes down below x [amount of minimum data/data-integrity] 
#which is dependent on difficulty settings. The second action they take is the slow accumulation of pop-ups. 
#The quickness of this is dependent on the amount of hackers who are in the system.

#Pop-ups themselves are not inherently dangerous. Their only ‘goal’ is to block information. The way I want 
#them to work would mean that for high-skilled gameplay pop-ups would only be an inconvenience, rather than
#a problem that NEEDS to be fixed
#This might not be feasible for a first-true-game-project.

#Finally, the <<Return_To_Sender or Offensive>> phase. This is an optional phase. It can be done any time when
#you have less than 100% data/data-integrity. The aim of this phase is to gain any lost data/data-integrity 
#back from the hackers. Doing minigames in this phase will give you back some percentage of data/data-integrity. 
#Overtime will both improve per-minigame gain and also slowly create a gain-rate as time goes on. 
#This is a pure aura/hype moment feature to facilitate “come-backs” and SHOULD be discussed as it could ruin 
#balance if done incorrectly.}
