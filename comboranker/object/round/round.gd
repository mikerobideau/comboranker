extends Control
class_name Round

@onready var top_row = $Main/TopRowMargin/TopRow
@onready var bottom_row = $Main/BottomRowMargin/BottomRow
@onready var deck = $Main/BottomRowMargin/BottomRow/Deck
@onready var top_pile1 = $Main/TopRowMargin/TopRow/Pile1
@onready var top_pile2 = $Main/TopRowMargin/TopRow/Pile2
@onready var top_pile3 = $Main/TopRowMargin/TopRow/Pile3
@onready var top_pile4 = $Main/TopRowMargin/TopRow/Pile4
@onready var top_piles: Array[Pile]
@onready var pile1 = $Main/BottomRowMargin/BottomRow/Pile1
@onready var pile2 = $Main/BottomRowMargin/BottomRow/Pile2
@onready var pile3 = $Main/BottomRowMargin/BottomRow/Pile3
@onready var pile4 = $Main/BottomRowMargin/BottomRow/Pile4
@onready var piles: Array[Pile]

var selected_card: Card

func _ready() -> void:
	piles = [pile1, pile2, pile3, pile4]
	top_piles = [top_pile1, top_pile2, top_pile3, top_pile4]
	for pile in top_piles:
		pile.clicked.connect(on_pile_clicked)
	deck.card_clicked.connect(on_card_clicked)
	deck.shuffle()
	deal()
	 
func deal() -> void:
	for i in range(4):
		var card = deck.deal()
		var pile = piles[i % piles.size()]
		pile.add(card)

func on_card_clicked(card: Card) -> void:
	print_debug('card selected')
	selected_card = card

func on_pile_clicked(pile: Pile) -> void:
	print_debug('pile clicked')
	if selected_card:
		print_debug('adding card')
		pile.add(selected_card)
		selected_card = null
