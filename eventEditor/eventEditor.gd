extends GraphEdit

func _ready():
	var addButton = Button.new()
	addButton.text = "Add subEvent"
	addButton.pressed.connect(_onAddButtonPressed)
	get_menu_hbox().add_child(addButton)

func _on_connection_request(from_node, from_port, to_node, to_port):
	connect_node(from_node, from_port, to_node, to_port)


func _on_disconnection_request(from_node, from_port, to_node, to_port):
	disconnect_node(from_node, from_port, to_node, to_port)

func _onAddButtonPressed():
	var newEvent = preload("res://eventEditor/eventNode.tscn").instantiate()
	newEvent.position_offset = get_local_mouse_position() + Vector2(0, 100)
	add_child(newEvent)
