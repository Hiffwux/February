extends Control

@export_multiline var descriptionOfEvent: String
@export var image: ImageTexture
@export var button1Text: String
@export var button2Text: String
@export var button3Text: String
@export var buttonEndText: String

@export var actionOfButton1: String
@export var actionOfButton2: String
@export var actionOfButton3: String 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _button1Pressed():
	str_to_var(actionOfButton1)

func _button2Pressed():
	pass # Replace with function body.


func _button3Pressed():
	pass # Replace with function body.


func _buttonEndPressed():
	pass # Replace with function body.
