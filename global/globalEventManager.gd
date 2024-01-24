extends Node
var eventDictionary: Dictionary

func _ready():
	var eventJson = FileAccess.open("res://events/febr_events_sample.json",FileAccess.READ)
	eventDictionary = JSON.parse_string(eventJson.get_as_text())
	eventJson.close()
	print(eventDictionary)
