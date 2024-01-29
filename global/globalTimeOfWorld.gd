extends Node

class_name TimeOfWorld

signal hour_changed
signal minute_changed
signal day_changed
#signal fate_pass_time

var day: int = 1
var hour: int = 0
var minute: int = 0
var second: float = 0
var time_speed: float = 120


func _process(delta):
	var is_minute_changed := false
	var is_hour_changed := false
	second += delta * time_speed
	if second >= 60:
		second -= 60
		minute+=1
		is_minute_changed = true
	
	if minute >= 60:
		minute -= 60
		hour+=1
		is_hour_changed = true
	
	if hour >= 24:
		hour-=24
		day+=1
		day_changed.emit()
	
	if is_minute_changed:
		minute_changed.emit()
	if is_hour_changed:
		hour_changed.emit()

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

func fateStartTimer(eventScene, fateTimer):
	fateTimer.start(10)
	fateTimer.timeout.connect(fateCheckEvent.bind(eventScene, fateTimer))
	
func fateCheckEvent(eventScene, fateTimer):
	var fateEvent = randi_range(1, 10)
	print(fateEvent)
	#var fateTypeOfEvent
	if (fateEvent <= 10):
		fateTimer.stop()
		time_speed = 0
		eventScene.startEvent(GlobalEventManager.allEvents[0])
	else:
		pass
