extends Window

@onready var time = $GridContainer/time
@onready var endurance = $GridContainer/endurance
@onready var optimization = $GridContainer/optimization
@onready var sanity = $GridContainer/sanity
@onready var health = $GridContainer/health

func _ready():
	visible = false
	GlobalTimeOfWorld.minute_changed.connect(_onTimeChanged)

func _onTimeChanged():
	time.text = "%s %s:%s" % [
		GlobalTimeOfWorld.get_formatted_day(), 
		GlobalTimeOfWorld.get_formatted_hour(), 
		GlobalTimeOfWorld.get_formatted_minute()]

func _process(delta):
	if Input.is_action_just_pressed("openDebugPanel"):
		visible = not visible
	
	#если меня не видно, то зачем мне обновлять своё состояние?
	if not visible:
		return
	update_stats()

func update_stats():
	endurance.text = str(GlobalStats.endurance)
	optimization.text = str(GlobalStats.optimization)
	sanity.text = str(GlobalStats.sanity)
	health.text = str(GlobalStats.health)

func _on_close_requested():
	visible = false


func _on_restart_game_pressed():
	pass
