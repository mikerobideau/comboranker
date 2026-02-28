extends MarginContainer
class_name Score

@onready var combo_label = $HBox/Combo
@onready var score_label = $HBox/Score

var score := 0
var combo := 1

func _ready() -> void:
	update_labels()
	
func add_combo(value: int) -> void:
	combo += value
	update_labels()
	
func reset_combo() -> void:
	combo = 0
	update_labels()
	
func add(value: int) -> void:
	print_debug('adding ' + str(value) + ' x ' + str(combo))
	score += (combo * value)
	update_labels()
	
func update_labels() -> void:
	combo_label.text = str(combo)
	score_label.text = str(score)
