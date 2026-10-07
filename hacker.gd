extends Node2D
var phase = 0 # 0 == <<PREVENTATIVE or BREACHING>>, 1 == <<CORRECTIVE or HACKED>>, 2 <<OFFENSIVE or RETURN_TO_SENDER>>
# 0 focuses on stopping hackers from even getting into the system, 
# 1 on getting the ones who already broke in out of the system, 
# and 2 on going into the hacker's systems to steal the info back
