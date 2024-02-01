@tool
extends Window

signal data_updated(data:Dictionary)

func _ready():
	_on_label_text_changed("")

func _on_label_text_changed(new_text):
	title = "Button " + new_text

func construct_from_button(button:Dictionary):
	pass

func get_updated_data()->Dictionary:
	return {
		"label": $GridContainer/label.text
		}

func _on_close_requested():
	data_updated.emit(get_updated_data())
	queue_free()
