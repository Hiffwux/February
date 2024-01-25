extends Control

@onready var label = $label
@onready var buttonContainer = $buttonContainer
@onready var nextButton = $next

var eventData:Dictionary

var nextSubEvent

func initEvent(event):
	if event == null:
		OS.alert("Конец")
		return
	label.text = event["text"]
	
	for button in event["buttons"]:
		var eventButton = Button.new()
		eventButton.text = button["label"]
		buttonContainer.add_child(eventButton)
		eventButton.pressed.connect(_buttonPressed.bind(button))

func _ready():
	startEvent(GlobalEventManager.allEvents[0])

func startEvent(event:Dictionary):
	eventData = event
	initEvent(eventData["root"])

func _buttonPressed(button:Dictionary):
	if button.has("statChanges"):
		var stats:Dictionary = button["statChanges"]
		for statName in stats.keys():
			GlobalStats.add_stat_by_name(statName, stats[statName])
	
	for child in buttonContainer.get_children():
		child.queue_free()
	
	var nextSubEventName = button.get("nextEvent", null)
	nextSubEvent = eventData.get(nextSubEventName, null)
	label.text = button["text"]
	nextButton.visible = true


func _on_next_pressed():
	nextButton.visible = false
	initEvent(nextSubEvent)
