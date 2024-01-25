extends Node

var allEvents := []

func _ready():
	var eventJson = FileAccess.open("res://events/febr_events_sample.json",FileAccess.READ)
	var eventDictionary = JSON.parse_string(eventJson.get_as_text())
	eventJson.close()
	
	allEvents.append(eventDictionary)
