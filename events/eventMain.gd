extends Control

@onready var label = $label
@onready var buttonContainer = $buttonContainer
@onready var nextButton = $next

var eventData:Dictionary

var nextSubEvent

func initEvent(event):
	if event == null:
		
		#var hideEvent = create_tween()
		#hideEvent.tween_property(label, "modulate", Color(1, 1, 1, 0), .5)
		#hideEvent.tween_property(buttonContainer, "modulate", Color(1, 1, 1, 0), .5)
		
		GlobalTimeOfWorld.time_speed = 360
		queue_free()
		return
	label.text = event["text"]
	
	for button in event["buttons"]:
		var eventButton = Button.new()
		eventButton.text = button["label"]
		buttonContainer.add_child(eventButton)
		eventButton.pressed.connect(_buttonPressed.bind(button))

func _ready():
	label.modulate = Color(1, 1, 1, 0)
	buttonContainer.modulate = Color(1, 1, 1, 0)
	#nextButton.modulate = Color(1, 1, 1, 0)
	#startEvent(GlobalEventManager.allEvents[0])
	pass

func startEvent(event:Dictionary):
	
	var showEvent = create_tween()
	showEvent.tween_property(label, "modulate", Color(1, 1, 1, 1), .5)
	showEvent.tween_property(buttonContainer, "modulate", Color(1, 1, 1, 1), .5)
	#showEvent.tween_property(nextButton, "modulate", Color(1, 1, 1, 1), .5)
	
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
