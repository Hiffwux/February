extends Node

@onready var dayAndTimeContainer = $dayAndTime
@onready var menuButtonsContainer = $menuButtons
@onready var dayLabel = $dayAndTime/HBoxContainer2/dayVar 
@onready var hoursLabel = $dayAndTime/HBoxContainer/hoursVar
@onready var minutesLabel = $dayAndTime/HBoxContainer/minutesVar
@onready var newTimer = $dayAndTime/HBoxContainer/newTime

func _ready():
	GlobalTimeOfWorld.minute_changed.connect(_onTimeOfWorldMinuteChanged)

func _process(delta):
	pass

func _awakeStartGame():
	GlobalTimeOfWorld.time_speed = 1000
	menuButtonsContainer.visible = false
	dayAndTimeContainer.visible = true

func _onTimeOfWorldMinuteChanged():
	dayLabel.text = GlobalTimeOfWorld.get_formatted_day()
	hoursLabel.text = GlobalTimeOfWorld.get_formatted_hour()
	minutesLabel.text =  GlobalTimeOfWorld.get_formatted_minute()
