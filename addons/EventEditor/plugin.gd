@tool
extends EditorPlugin

var eventEditor := preload("res://addons/EventEditor/eventEditor.tscn").instantiate()

func _enter_tree():
	EditorInterface.get_editor_main_screen().add_child(eventEditor)
	_make_visible(true)

func _exit_tree():
	EditorInterface.get_editor_main_screen().remove_child(eventEditor)
	eventEditor.queue_free()

func _has_main_screen():
	return true

func _make_visible(visible):
	eventEditor.visible = visible

func _get_plugin_name():
	return "eventEditor"

func _get_plugin_icon():
	return EditorInterface.get_editor_theme().get_icon("Node", "EditorIcons")
