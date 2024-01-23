extends Node
#class_name GlobalTime

signal hour_changed
signal minute_changed
signal day_changed

var day:int = 1
var hour:int = 12
var minute:int = 0
var second:float = 0

#var time_speed:float = 60 #за 1 секунду реального времени проходит 60 секунд виртуального времени
var time_speed:float = 60*60 #за 1 секунду реального времени проходит 60*60 секунд виртуального времени

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
	
	print(minute)
