extends GraphNode


func _on_name_edit_text_changed(new_text):
	title = new_text


func _on_add_button_pressed():
	var new_button = Button.new()
	new_button.text = "new button"
	new_button.pressed.connect(_onButtonPressed.bind(new_button))
	get_children()[-3].add_sibling(new_button)
	set_slot_enabled_right(new_button.get_index(), true)
	
	get_children()

func _onButtonPressed(button:Button):
	var buttonEditor = preload("res://eventEditor/buttonEditor.tscn").instantiate()
	buttonEditor.data_updated.connect(_onButtonDataUpdated.bind(button))
	add_child(buttonEditor)

func _onButtonDataUpdated(data:Dictionary, button:Button):
	button.text = data["label"]
