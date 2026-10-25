extends Node2D
@onready var itself = $"."
@onready var spt = $spawn_pts_timer # Spawn points timer
@onready var dlt = $data_loss_timer # Data loss timer

var phase = 0 # 0 == <<PREVENTATIVE or BREACHING>>, 1 == <<CORRECTIVE or HACKED>>, 2 <<OFFENSIVE or RETURN_TO_SENDER>>
# 0 focuses on stopping hackers from even getting into the system, 
# 1 on getting the ones who already broke in out of the system, 
# and 2 on going into the hacker's systems to steal the info back
var hacker_spawn_points = 0
@export var spawn_points_modifier = 1.0
@export var spawn_points_per_tick = 100
@export var difficulty = 1
@export var start_data_debug = 100.0
@export var data_loss_pts_threshold = 1000.0
var data = start_data_debug


func _process(_delta: float) -> void:
	if phase == 0 and spt.is_stopped():
		spt.start()
	elif phase == 1 and dlt.is_stopped():
		#print("HACKER IS IN THE BASE")
		dlt.start()
		
		

func _on_spawn_pts_timer_timeout() -> void:
	if phase == 0:
		#print(hacker_spawn_points)
		hacker_spawn_points += spawn_points_per_tick * spawn_points_modifier
		if hacker_spawn_points > 15000:
			#print("New hacker!!!")
			phase = 1
			spawn_points_modifier = 2.0
			hacker_spawn_points = 0

func _on_data_loss_timer_timeout() -> void:
	if phase == 1:
		hacker_spawn_points += spawn_points_per_tick * spawn_points_modifier
		print("Phase 2 (1) -> ", hacker_spawn_points)
		if hacker_spawn_points >= (data_loss_pts_threshold - (difficulty * 10)):
			if data > 30.0:
				data -= (-1 * data) + 100 / (data - (data * 0.9))
				print((-1 * data) + 100 / (data - (data * 0.9)), " DATA LOSS")
			else:
				data -= (data - 100) / (data - 39)
				print(((data - 100) / (data - 39)), " DATA LOSS")
				


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
