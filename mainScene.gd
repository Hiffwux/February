extends Node

@onready var dayAndTimeContainer = $dayAndTime
@onready var menuButtonsContainer = $menuButtons
@onready var dayLabel = $dayAndTime/HBoxContainer2/dayVar 
@onready var hoursLabel = $dayAndTime/HBoxContainer/hoursVar
@onready var minutesLabel = $dayAndTime/HBoxContainer/minutesVar
@onready var newTimer = $dayAndTime/HBoxContainer/newTime

func _ready():
	pass

func _process(delta):
	pass

func _awakeStartGame():
	GlobalTimeOfWorld.time_speed = 360
	menuButtonsContainer.visible = false
	dayAndTimeContainer.visible = true

func _onTimeOfWorldMinuteChanged():
	dayLabel.text = str(GlobalTimeOfWorld.day)
	hoursLabel.text = str(GlobalTimeOfWorld.hour)
	minutesLabel.text =  str(GlobalTimeOfWorld.minute)
