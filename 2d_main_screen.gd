extends Node

@onready var Events = $"2DEvents"
@onready var TextOfEvents = $"2DEvents/Label"
@onready var AwakeButton = $ColorRect/Button
@onready var ClockTimer = $ClockTimer
@onready var Hours = $Date/Hours
@onready var Minutes = $Date/Minutes

var MinuteValue: int = 0
var HourValue: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	TextOfEvents.visible = false
	Hours.text = var_to_str(HourValue)
	Minutes.text = var_to_str(MinuteValue)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_Time()
	pass


func _Time():
	if MinuteValue in range(10):
		Minutes.text = "0" + var_to_str(MinuteValue)
	else:
		Minutes.text = var_to_str(MinuteValue)
	
	if HourValue in range(10):
		Hours.text = "0" + var_to_str(HourValue)
	else:
		Hours.text = var_to_str(HourValue)
	
	if MinuteValue == 60:
		HourValue += 1
		MinuteValue = 0
	
	if HourValue == 24:
		HourValue = 0

func _Awake():
	AwakeButton.visible = false
	TextOfEvents.visible = true
	ClockTimer.start()
	pass # Replace with function body.

func _Clock_Start():
	MinuteValue += 1
	pass # Replace with function body.
