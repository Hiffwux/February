extends Node
#глобальные флаги

#Мой дурацкий подход
var hour = 0
var minute = 0

#Подход Вани
var timeSpeed = 1240.0
var timeElapsed = 0.0

var day = 0

func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timeElapsed += delta * timeSpeed

	var time = Time.get_time_dict_from_unix_time(timeElapsed)
	#timeLabel.text = str(time["hour"]) + ':' + str(time["minute"])
