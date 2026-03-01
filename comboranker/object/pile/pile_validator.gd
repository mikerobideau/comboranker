extends Panel
class_name PileValidator

enum ValidatorType {
	HIGH,
	LOW,
	EVEN,
	ODD,
	HEARTS,
	DIAMONDS,
	CLUBS,
	SPADES
}

@onready var label = $Label

var active_validator: ValidatorType

func _ready() -> void:
	random_validator()

func validate(card: Card) -> bool:
	match active_validator:
		ValidatorType.HIGH:
			return validate_high(card)
		ValidatorType.LOW:
			return validate_low(card)
		ValidatorType.EVEN:
			return validate_even(card)
		ValidatorType.ODD:
			return validate_odd(card)
		ValidatorType.HEARTS:
			return validate_hearts(card)
		ValidatorType.DIAMONDS:
			return validate_diamonds(card)	
		ValidatorType.CLUBS:
			return validate_clubs(card)	
		ValidatorType.SPADES:
			return validate_spades(card)
		_:
			return false
			
func validate_high(card: Card) -> bool:
	return card.data.rank >= 7
	
func validate_low(card: Card) -> bool:
	return card.data.rank <= 7
	
func validate_even(card: Card) -> bool:
	return card.data.rank % 2 == 0
	
func validate_odd(card: Card) -> bool:
	return card.data.rank % 2 != 0
	
func validate_hearts(card: Card) -> bool:
	return card.data.suit == Card.SUIT.HEARTS
	
func validate_diamonds(card: Card) -> bool:
	return card.data.suit == Card.SUIT.DIAMONDS
	
func validate_clubs(card: Card) -> bool:
	return card.data.suit == Card.SUIT.CLUBS
	
func validate_spades(card: Card) -> bool:
	return card.data.suit == Card.SUIT.SPADES
	
func random_validator() -> void:
	active_validator = ValidatorType.values().pick_random()
	update_label()
	
func update_label() -> void:
	match active_validator:
		ValidatorType.HIGH:
			label.text = 'High'
		ValidatorType.LOW:
			label.text = 'Low'
		ValidatorType.EVEN:
			label.text = 'Even'
		ValidatorType.ODD:
			label.text = 'Odd'
		ValidatorType.HEARTS:
			label.text = 'Hearts'
		ValidatorType.DIAMONDS:
			label.text = 'Diamonds'
		ValidatorType.CLUBS:
			label.text = 'Clubs'
		ValidatorType.SPADES:
			label.text = 'Spades'
		_:
			''
