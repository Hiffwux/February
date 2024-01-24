extends Control

@onready var labelContainer = $labelContainer
@onready var buttonContainer = $buttonContainer

#для облегчения
#var dict = GlobalEventManager.eventDictionary
var indexInt: int = -1
var eventPickId: int = 0

func _ready():
	#забираю текст
	var eventLabel = Label.new()
	eventLabel.text = GlobalEventManager.eventDictionary["event"+ str(eventPickId)]["text"]
	labelContainer.add_child(eventLabel)
	
	#забираю кнопки
	for button in GlobalEventManager.eventDictionary["event"+ str(eventPickId)]["buttons"]:
		indexInt += 1
		var eventButton = Button.new()
		eventButton.text = button["label"]
		buttonContainer.add_child(eventButton)
		eventButton.pressed.connect(_applyChanges.bind(indexInt))
		
	
	#for button in GlobalEventManager.eventDictionary["event0"]["buttons"]:
		#var eventButton =  Button.new()
		#eventButton.text = button["text"]
		#$HBoxContainer.add_child(eventButton)
		#eventButton.pressed.connect(_eventButtonPressed.bind(button["text"]))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _applyChanges(index):
	for stats in GlobalEventManager.eventDictionary["event"+ str(eventPickId)]["buttons"][index]["stat"]:
		if (stats != null):
			
	
			print('Success?')
		else:
			print("Stats are empty")

func _endEvent():
	print("END")
