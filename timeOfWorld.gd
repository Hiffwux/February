extends Node

#
#Переменная отвечающая
#за задержку внутри таймеров
var cooldown = 0.2

#
#Переменные отвечающие напрямую
#за дни, часы и минуты
var days = 0
var hours = 0
var minutes = 0

#
#Основной таймер отвечающий
#за все время в игре
#(ваня не бей пж)
@onready var mainTimer = $mainTimer

func _ready():
	mainTimer.stop()
	mainTimer.wait_time = cooldown


func _process(delta):
	_mainTimerLogic()


func _mainTimerCounting():
	#
	#я увеличиваю минуту 
	#после кждой проработки таймера
	minutes += 1

func _mainTimerLogic():
	#
	#если минуты равны 60
	#происходит обнуление минут
	#и добовляется час
	if minutes == 60:
		hours += 1
		minutes = 0
	
	#
	#аналогичное обнуление с часами
	if hours == 24:
		hours = 0
