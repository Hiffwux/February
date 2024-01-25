extends Node

class_name TimeOfWorld

signal hour_changed
signal minute_changed
signal day_changed

var day: int = 1
var hour: int = 0
var minute: int = 0
var second: float = 0

var time_speed: float = 120

func _process(delta):
	second += delta * time_speed
	if second >= 60:
		second -= 60
		minute+=1
		minute_changed.emit()
	
	if minute >= 60:
		minute -= 60
		hour+=1
		hour_changed.emit()
	
	if hour >= 24:
		hour-=24
		day+=1
		day_changed.emit()

func get_formatted_hour()->String:
	if hour < 10:
		return "0" + str(hour)
	return str(hour)

func get_formatted_day()->String:
	if day < 10:
		return "0" + str(day)
	return str(day)

func get_formatted_minute()->String:
	if minute < 10:
		return "0" + str(minute)
	return str(minute)
