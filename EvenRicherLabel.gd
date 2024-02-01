extends RichTextLabel

class_name EvenRicherLabel

signal custom_tag_found(params:PackedStringArray)

static var tags := "addSTAT|custom_signal"

static var regex := RegEx.create_from_string("\\[(?<tag_name>" + tags + ") ?(?<tag_params>[^]]{1,})?\\]")

func _ready():
	bbcode_enabled = true

func set_text_with_custom_tags(new_text:String):
	text = _parse_custom_tags(new_text)

func _parse_custom_tags(new_text:String) -> String:
	for rmatch in regex.search_all(new_text):
		var tag_name := rmatch.get_string("tag_name")
		var tag_params := rmatch.get_string("tag_params").split(" ")
		
		if tag_name == "addSTAT":
			GlobalStats.add_stat_by_name(tag_params[0], int(tag_params[1]))
		if tag_name == "custom_signal":
			custom_tag_found.emit(tag_params)
	
	return regex.sub(new_text, "", true)
