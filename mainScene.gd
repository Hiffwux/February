extends Node
@onready var time = $dayAndTime/time
@onready var days = $dayAndTime/day
@onready var clockTimer = $clockTimer

func _ready():
	pass # Replace with function body.

func _process(delta):
	days.text = str(GlobalStats.day)
	GlobalStats.clockWithTimeElapsed(delta, time)
	
	if time.text == '1:0':
		GlobalStats.day +=1

