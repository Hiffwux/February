extends EditorInspectorPlugin

signal picked_event_object(object:JSON)

func _can_handle(object):
	if object is JSON:
		picked_event_object.emit(object)
		return true
	else:
		return false
