extends Panel
class_name Passive

@onready var label = $Label

var data: PassiveData

func _ready() -> void:
	update_label()
	
func set_data(data: PassiveData) -> void:
	self.data = data
	update_label()
	
func update_label() -> void:
	if !label:
		return
	if !data:
		label.text = ''
		return
	label.text = data.name
