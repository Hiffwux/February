extends Control

@onready var labelContainer = $labelContainer
@onready var buttonContainer = $buttonContainer

#для облегчения
#var dict = GlobalEventManager.eventDictionary
var eventPickId: int = 0

func _ready():
	#забираю текст
	var eventLabel = Label.new()
	eventLabel.text = GlobalEventManager.eventDictionary["event"+ str(eventPickId)]["text"]
	labelContainer.add_child(eventLabel)
	
	#забираю кнопки
	for button in GlobalEventManager.eventDictionary["event"+ str(eventPickId)]["buttons"]:
		var eventButton = Button.new()
		eventButton.text = button["label"]
		buttonContainer.add_child(eventButton)
		eventButton.pressed.connect(_applyChanges.bind(button))
		
	
	#for button in GlobalEventManager.eventDictionary["event0"]["buttons"]:
		#var eventButton =  Button.new()
		#eventButton.text = button["text"]
		#$HBoxContainer.add_child(eventButton)
		#eventButton.pressed.connect(_eventButtonPressed.bind(button["text"]))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _applyChanges(button:Dictionary):
	if button.has("statChanges"):
		var stats:Dictionary = button["statChanges"]
		for statName in stats.keys():
			GlobalStats.add_stat_by_name(statName, stats[statName])

func _endEvent():
	print("END")
