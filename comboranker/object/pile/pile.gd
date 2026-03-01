extends Panel
class_name Pile

signal clicked(pile: Pile)

@onready var cards = $Cards
@onready var validator = $PileValidator

var is_board = false
var is_discard = false
	
func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			clicked.emit(self)

func add(card: Card) -> void:
	if card.get_parent():
		card.get_parent().remove_child(card)
	card.mouse_filter = MouseFilter.MOUSE_FILTER_PASS
	cards.add_child(card)
			
func get_top_card() -> Card:
	var num_cards = cards.get_child_count()
	if num_cards == 0:
		return null
	return cards.get_child(num_cards - 1)
	
func random_validator() -> void:
	validator.random_validator()
	
func validate(card: Card) -> bool:
	if validator and !validator.visible:
		push_warning('Pile validate() called, but has_validator is set to false')
		return true
	return validator.validate(card)
