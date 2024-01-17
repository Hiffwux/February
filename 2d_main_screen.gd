extends Node

@onready var Events = $"2DEvents"
@onready var TextOfEvents = $"2DEvents/Label"
@onready var AwakeButton = $ColorRect/Button
@onready var ClockTimer = $ClockTimer
@onready var Hours = $Date/Hours
@onready var Minutes = $Date/Minutes

var MinuteValue: int = 0
var HourValue: int = 0
var DayValue: int = 0

var TimeElapsed:float = 0.0
var timeSpeed:float = 60*60

# Called when the node enters the scene tree for the first time.
func _ready():
	TextOfEvents.visible = false
	Hours.text = var_to_str(HourValue)
	Minutes.text = var_to_str(MinuteValue)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	TimeElapsed += delta * timeSpeed
	#_Time()
	var time = Time.get_time_dict_from_unix_time(TimeElapsed)
	Minutes.text = str(time["minute"])
	Hours.text = str(time["hour"])


func _Time():
	if MinuteValue in range(10):
		Minutes.text = "0" + var_to_str(MinuteValue)
	else:
		Minutes.text = var_to_str(MinuteValue)
	
	if HourValue in range(10):
		Hours.text = "0" + var_to_str(HourValue)
	else:
		Hours.text = var_to_str(HourValue)

func _Awake():
	AwakeButton.visible = false
	TextOfEvents.visible = true
	ClockTimer.start()
	pass # Replace with function body.

func _Clock_Start():
	MinuteValue += 1
	if MinuteValue == 60:
		HourValue += 1
		MinuteValue = 0
	
	if HourValue == 24:
		HourValue = 0
