extends Panel
class_name Card

signal clicked(card: Card)

@onready var top_left_rank = $TopLeft/Rank
@onready var bottom_right_rank = $BottomRight/Rank
@onready var suit_label = $Suit

enum SUIT {
	HEARTS,
	DIAMONDS,
	CLUBS,
	SPADES
}

const SUIT_NAMES = {
	SUIT.HEARTS: 'Hearts',
	SUIT.DIAMONDS: 'Diamonds',
	SUIT.CLUBS: 'Clubs',
	SUIT.SPADES: 'Spades'
}

var rank: int
var suit: SUIT
var data: CardData

func _ready() -> void:
	update_labels()
	
func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			clicked.emit(self)

func set_data(data: CardData) -> void:
	self.data = data
	rank = data.rank
	suit = data.suit

func update_labels() -> void:
	var rank_label = get_rank_label(rank)
	top_left_rank.text = rank_label
	bottom_right_rank.text = rank_label
	suit_label.text = SUIT_NAMES.get(suit)
	
func get_rank_label(rank: int) -> String:
	match rank:
		11:
			return 'J'
		12:
			return 'Q'
		13: 
			return 'K'
		14:
			return 'A'
		_:
			return str(rank)
