extends Label

func _on_time_test_minute_changed():
	text = "{} ноября {}:{}".format(
		[$time_test.day, $time_test.hour, $time_test.minute], "{}")
