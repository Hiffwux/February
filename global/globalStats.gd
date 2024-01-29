extends Node

#Параметры отвечающие за здоровье
#когда они доходят до нуля, они начинают сильнее
#понижать здоровье и предоставлять различные
#минусы главному герою
var endurance : int = 0
var optimization : int = 0
var sanity : int = 0

var money: int = 0

#Основный параметр, изначально не показывается
#может быть виньеткой показывать
#когда здоровье падает до нуля, то это конец игры
#с обнулением дней до самого первого и сбросом сохранений
var health : int = 0

func _ready():
	pass

func _process(delta):
	pass

func add_stat_by_name(stat:String, value:int):
	match stat:
		"END": endurance += value
		"OPT": optimization += value
		"SAN": sanity += value
		"HLT": health += value
