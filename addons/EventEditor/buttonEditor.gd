@tool
extends Window

var buttonData:Dictionary
var original_button:Button

func init(data:Dictionary, button:Button):
	buttonData = data
	original_button = button
	
	$GridContainer/label.text = data.get("label", "")
	$GridContainer/text.text = data.get("text", "")
	$GridContainer/nextEvent.text = data.get("nextEvent", "")


func _on_label_text_changed(new_text):
	buttonData["label"] = new_text
	title = "Button " + new_text
	original_button.name = new_text
	original_button.text = new_text

func _on_close_requested():
	queue_free()


func _on_text_text_changed():
	buttonData["text"] = $GridContainer/text.text
