extends Panel
class_name Deck

signal card_clicked(card: Card)

var cards: Array[Card] = []
var factory: CardFactory

func _ready() -> void:
	factory = CardFactory.new()
	populate()

func populate() -> void:
	for rank in Constants.RANKS:
		for suit in Constants.SUITS:
			var data = CardData.new()
			data.rank = rank
			data.suit = suit
			var card = factory.create(data)
			
			#TODO: Remove test resolver
			#var resolver = AddComboResolver.new()
			#resolver.amount = 1
			#card.resolver = resolver
			
			cards.append(card)
			card.clicked.connect(on_card_clicked)

func on_card_clicked(card: Card) -> void:
	card_clicked.emit(card)			
			
func shuffle() -> void:
	cards.shuffle()

func deal() -> Card:
	return cards.pop_front()
