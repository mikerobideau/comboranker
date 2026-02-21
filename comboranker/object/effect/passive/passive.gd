extends Panel
class_name Passive

@onready var label = $Label

func _ready() -> void:
	update_label()
	
func update_label() -> void:
	label.text = name
