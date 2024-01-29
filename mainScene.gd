extends Node

@onready var dayAndTimeContainer = $dayAndTime
@onready var menuButtonsContainer = $menuButtons
@onready var dayLabel = $dayAndTime/HBoxContainer2/dayVar 
@onready var hoursLabel = $dayAndTime/HBoxContainer/hoursVar
@onready var minutesLabel = $dayAndTime/HBoxContainer/minutesVar
@onready var newTimer = $dayAndTime/HBoxContainer/newTime

@onready var fateTimer = $Timer

@onready var eventScene = $EventMain

func _ready():
	GlobalTimeOfWorld.time_speed = 0
	GlobalTimeOfWorld.minute_changed.connect(_onTimeOfWorldMinuteChanged)

func _process(delta):
	pass

func _awakeStartGame():
	GlobalTimeOfWorld.fateStartTimer(eventScene, fateTimer)
	#eventScene.startEvent(GlobalEventManager.allEvents[0])
	GlobalTimeOfWorld.time_speed = 360
	menuButtonsContainer.visible = false
	dayAndTimeContainer.visible = true

func _onTimeOfWorldMinuteChanged():
	dayLabel.text = GlobalTimeOfWorld.get_formatted_day()
	hoursLabel.text = GlobalTimeOfWorld.get_formatted_hour()
	minutesLabel.text =  GlobalTimeOfWorld.get_formatted_minute()
