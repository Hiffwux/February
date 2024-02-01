@tool
extends EditorPlugin

var eventEditor := preload("res://addons/EventEditor/eventEditor.tscn").instantiate()
var eventInspector := preload("res://addons/EventEditor/eventInspector.gd").new()

func _enter_tree():
	EditorInterface.get_editor_main_screen().add_child(eventEditor)
	_make_visible(true)
	add_inspector_plugin(eventInspector)
	eventInspector.picked_event_object.connect(eventEditor.edit_event)

func _exit_tree():
	EditorInterface.get_editor_main_screen().remove_child(eventEditor)
	eventEditor.queue_free()
	remove_inspector_plugin(eventInspector)

func _has_main_screen():
	return true

func _make_visible(visible:bool):
	eventEditor.visible = visible

func _get_plugin_name():
	return "eventEditor"

func _get_plugin_icon():
	return EditorInterface.get_editor_theme().get_icon("Node", "EditorIcons")

func _save_external_data():
	eventEditor.save_current_event()
