extends Node

@onready var dayAndTimeContainer = $dayAndTime
@onready var menuButtonsContainer = $menuButtons
@onready var hoursLabel = $dayAndTime/HBoxContainer/hoursVar
@onready var minutesLabel = $dayAndTime/HBoxContainer/minutesVar
@onready var eventsHolder = $"EventsHolder"

var fateNumber = randi_range(1,3)

func _ready():
	#eventsHolder.
	hoursLabel.text = str(TimeOfWorld.hours)
	minutesLabel.text = str(TimeOfWorld.minutes)
	dayAndTimeContainer.visible = false

func _process(delta):
	_displayTimeOfWorld()

func _displayTimeOfWorld():
	if TimeOfWorld.minutes in range(10):
		minutesLabel.text = "0" + str(TimeOfWorld.minutes)
	else:
		minutesLabel.text = str(TimeOfWorld.minutes)

	if TimeOfWorld.hours in range(10):
		hoursLabel.text = "0" + str(TimeOfWorld.hours)
	else:
		hoursLabel.text = str(TimeOfWorld.hours)

func _awakeStartGame():
	TimeOfWorld.mainTimer.start()
	menuButtonsContainer.visible = false
	dayAndTimeContainer.visible = true


func _on_button_pressed():
	eventsHolder.get_node("Event1").visible = true
	
