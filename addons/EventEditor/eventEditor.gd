@tool
extends GraphEdit

var eventFile:JSON
var event:Dictionary

func _ready():
	var addButton = Button.new()
	addButton.text = "Add subEvent"
	addButton.pressed.connect(_onAddButtonPressed)
	get_menu_hbox().add_child(addButton)

func connect_button_to_event(button:Button, event_name:String):
	connect_node(button.get_parent().name, button.get_index()-2, event_name, 0)

func _on_connection_request(from_node, from_port, to_node, to_port):
	connect_node(from_node, from_port, to_node, to_port)
	eventFile.emit_changed()


func _on_disconnection_request(from_node, from_port, to_node, to_port):
	disconnect_node(from_node, from_port, to_node, to_port)
	eventFile.emit_changed()

func _onAddButtonPressed():
	var newEvent = preload("res://addons/EventEditor/eventNode.tscn").instantiate()
	newEvent.position_offset = get_local_mouse_position() + Vector2(0, 100)
	add_child(newEvent)

func edit_event(new_event:JSON):
	event = new_event.data
	eventFile = new_event
	for child in get_children():
		child.queue_free()
	
	for sub_event_name in event.keys():
		var newEvent = preload("res://addons/EventEditor/eventNode.tscn").instantiate()
		newEvent.name = sub_event_name
		add_child(newEvent)
		newEvent.init(sub_event_name, event[sub_event_name])
		newEvent.selected = true
	
	arrange_nodes()

func save_current_event():
	if eventFile == null:
		return
	ResourceSaver.save(eventFile)
