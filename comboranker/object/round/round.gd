extends Control
class_name Round

@onready var score = $Score
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
		pile.is_board = true
		pile.clicked.connect(on_pile_clicked)
	deck.card_clicked.connect(on_card_clicked)
	deck.shuffle()
	deal()
	 
func deal() -> void:
	for i in range(deck.cards.size()):
		var card = deck.deal()
		var pile = piles[i % piles.size()]
		pile.add(card)

func on_card_clicked(card: Card) -> void:
	var pile = card.get_parent()
	if pile.is_board:
		on_pile_clicked(pile)
	else:
		selected_card = card
	
func on_pile_clicked(pile: Pile) -> void:
	if selected_card:
		pile.add(selected_card)
		score.add_combo(1)
		score.add(selected_card.rank)
		selected_card = null
