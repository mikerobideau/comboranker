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
	randomize()

func validate(card: Card, validator: ValidatorType) -> bool:
	match validator:
		ValidatorType.HIGH:
			return validate_high(card)
		_:
			return false
			
func validate_high(card: Card) -> bool:
	return card.rank >= 7
	
func randomize() -> void:
	active_validator = ValidatorType.values().pick_random()
	
func get_label() -> void:
	match active_validator:
		ValidatorType.HIGH:
			label.text = 'High'
		_:
			''
