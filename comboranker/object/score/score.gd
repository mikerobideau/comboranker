extends Control
class_name Score

@onready var label = $Text

var score := 0

func _ready() -> void:
	if label:
		update_label()
	
func add(new_score: int) -> void:
	score += new_score
	update_label()
	
func update_label() -> void:
	label.text = str(score)
