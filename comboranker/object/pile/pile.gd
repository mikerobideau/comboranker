extends Panel
class_name Pile

signal clicked(pile: Pile)

func add(card: Card) -> void:
	if card.get_parent():
		card.get_parent().remove_child(card)
	add_child(card)

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print_debug('clicked')
			clicked.emit(self)
