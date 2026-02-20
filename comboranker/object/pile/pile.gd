extends Panel
class_name Pile

signal clicked(pile: Pile)

var is_board = false
var is_discard = false

func add(card: Card) -> void:
	if card.get_parent():
		card.get_parent().remove_child(card)
	add_child(card)

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			clicked.emit(self)
			
func get_top_card() -> Card:
	return get_child(get_child_count() - 1)
