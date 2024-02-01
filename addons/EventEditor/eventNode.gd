@tool
extends GraphNode

var event:Dictionary

func init(eventName:String, subevent:Dictionary):
	$nameEdit.text = eventName
	title = eventName
	$TextEdit.text = subevent.get("text", "")
	
	for button in subevent.get("buttons", []):
		var new_button = Button.new()
		new_button.text = button["label"]
		new_button.pressed.connect(_onButtonPressed.bind(new_button, button))
		get_children()[-3].add_sibling(new_button)
		set_slot_enabled_right(new_button.get_index(), true)
		
		if button.get("nextEvent", null) != null:
			get_parent().connect_button_to_event(new_button, button["nextEvent"])

func _on_name_edit_text_changed(new_text):
	title = new_text
	name = new_text

func _on_add_button_pressed():
	var new_button_data := {"label": "Выбор" + str(get_child_count()-3)}
	event["buttons"].append(new_button_data)
	
	var new_button = Button.new()
	new_button.text = new_button_data["label"]
	new_button.pressed.connect(_onButtonPressed.bind(new_button, new_button_data))
	get_children()[-3].add_sibling(new_button)
	set_slot_enabled_right(new_button.get_index(), true)

func _onButtonPressed(button:Button, button_data:Dictionary):
	var buttonEditor = preload("res://addons/EventEditor/buttonEditor.tscn").instantiate()
	buttonEditor.tree_exited.connect(_onButtonEditorClosed.bind(button, button_data))
	add_child(buttonEditor)
	buttonEditor.init(button_data, button)

func _onButtonEditorClosed(button:Button, data:Dictionary):
	button.text = data["label"]
	button.name = data["label"]
