extends Panel
class_name Pile

signal clicked(pile: Pile)

@onready var cards = $Cards
@onready var validator = $PileValidator

var is_board = false
var is_discard = false
var has_validator = false
	
func _on_cards_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			clicked.emit(self)
		
func set_has_validator(value: bool) -> void:
	has_validator = value
	validator.visible = value

func add(card: Card) -> void:
	if card.get_parent():
		card.get_parent().remove_child(card)
	cards.add_child(card)
			
func get_top_card() -> Card:
	return cards.get_child(get_child_count() - 1)
	
func validate(card: Card) -> bool:
	print_debug('Validating')
	if !has_validator:
		push_warning('Pile validate() called, but has_validator is set to false')
	return validator.validate()
