extends Panel
class_name PileValidator

enum ValidatorType {
	HIGH,
	#LOW,
	#EVEN,
	#ODD,
	#HEARTS,
	#DIAMONDS,
	#CLUBS,
	#SPADES
}

@onready var label = $Label

var active_validator: ValidatorType

func _ready() -> void:
	random_validator()

func validate(card: Card) -> bool:
	match active_validator:
		ValidatorType.HIGH:
			return validate_high(card)
		_:
			return false
			
func validate_high(card: Card) -> bool:
	return card.data.rank >= 7
	
func random_validator() -> void:
	active_validator = ValidatorType.values().pick_random()
	update_label()
	
func update_label() -> void:
	match active_validator:
		ValidatorType.HIGH:
			label.text = 'High'
		_:
			''
