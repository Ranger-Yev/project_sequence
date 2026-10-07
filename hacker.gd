extends Node2D
@onready var itself = $"."
@onready var spt = $spawn_pts_timer # Spawn points timer

var phase = 0 # 0 == <<PREVENTATIVE or BREACHING>>, 1 == <<CORRECTIVE or HACKED>>, 2 <<OFFENSIVE or RETURN_TO_SENDER>>
# 0 focuses on stopping hackers from even getting into the system, 
# 1 on getting the ones who already broke in out of the system, 
# and 2 on going into the hacker's systems to steal the info back
var hacker_spawn_points = 0
var spawn_points_modifier = 1.0

func _process(delta: float) -> void:
	if spt.is_stopped():
		spt.start()
	

func _on_spawn_pts_timer_timeout() -> void:
	if phase == 0:
		print(hacker_spawn_points)
		hacker_spawn_points += 100 * spawn_points_modifier


#HACKING SIDE-TERMINAL{
#!!!Hackers >>> Old security systems have made the base vulnerable. You have a side monitor set up to 
#only show the hackers’ progress. Most are bumbling idiots or infighting morons. Some hackers will be 
#emphasized in some way that makes them unique. These are dangerous ones. They deplete data over time. 
#If not dealt with quickly they accumulate and make the data loss faster and make pop ups appear faster.
#!!!Pop-ups >>> If at least one hacker is in the system, pop-ups will start appearing. 
#They block portions of the hacking terminal but can be closed to make it visible again.
#!!!Data >>> Over time hackers will extract some data. Doing completely optional minigames will get some back. 
#Be sure not to lose too much or you might have to do over time to get it back. 
#Minigames will include building your firewall, etc, etc…

#Hackers start in the <<Breaching or Preventative>> (the phase for the player). 
#In this phase the guard will have to use preventative measures to stop them from breaking into the system. 
#Hackers will start adding up points every x amount of time. Do minigames that will slow down hacker 
#accumulation of hacker points. There can be multiple hackers up to a maximum number that’s not decided yet.

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
