extends Node

@onready var dayAndTimeContainer = $dayAndTime
@onready var menuButtonsContainer = $menuButtons
@onready var dayLabel = $dayAndTime/HBoxContainer2/dayVar 
@onready var hoursLabel = $dayAndTime/HBoxContainer/hoursVar
@onready var minutesLabel = $dayAndTime/HBoxContainer/minutesVar
@onready var newTimer = $dayAndTime/HBoxContainer/newTime

@onready var fateTimer = $Timer

var eventSceneBase = preload("res://events/eventMain.tscn")

func _ready():
	GlobalTimeOfWorld.time_speed = 0
	GlobalTimeOfWorld.minute_changed.connect(_onTimeOfWorldMinuteChanged)

func _process(delta):
	pass

func _awakeStartGame():
	GlobalTimeOfWorld.minute_changed.connect(fateCheckEvent)
	GlobalTimeOfWorld.time_speed = 360
	menuButtonsContainer.visible = false
	dayAndTimeContainer.visible = true

func _onTimeOfWorldMinuteChanged():
	dayLabel.text = GlobalTimeOfWorld.get_formatted_day()
	hoursLabel.text = GlobalTimeOfWorld.get_formatted_hour()
	minutesLabel.text =  GlobalTimeOfWorld.get_formatted_minute()

func fateCheckEvent():
	
	var eventScene = eventSceneBase.instantiate()
	add_child(eventScene)
	
	#if randf() < 0.01:
		#print("lol")
	
	var fateEvent = randf()
	print(fateEvent)
	if (fateEvent <= 0.01):
		GlobalTimeOfWorld.time_speed = 0
		eventScene.startEvent(GlobalEventManager.allEvents[0])
	else:
		pass
