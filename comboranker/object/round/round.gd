extends Control
class_name Round

@onready var sound = $Sound
@onready var passives = $Passives
@onready var score = $Score
@onready var top_row = $Main/TopRowMargin/TopRow
@onready var bottom_row = $Main/BottomRowMargin/BottomRow
@onready var deck = $Main/BottomRowMargin/BottomRow/Deck
@onready var top_pile1 = $Main/TopRowMargin/TopRow/Pile1
@onready var top_pile2 = $Main/TopRowMargin/TopRow/Pile2
@onready var top_pile3 = $Main/TopRowMargin/TopRow/Pile3
@onready var top_pile4 = $Main/TopRowMargin/TopRow/Pile4
@onready var discard_pile = $Main/TopRowMargin/TopRow/Discard
@onready var top_piles: Array[Pile]
@onready var pile1 = $Main/BottomRowMargin/BottomRow/Pile1
@onready var pile2 = $Main/BottomRowMargin/BottomRow/Pile2
@onready var pile3 = $Main/BottomRowMargin/BottomRow/Pile3
@onready var pile4 = $Main/BottomRowMargin/BottomRow/Pile4
@onready var piles: Array[Pile]

var selected_card: Card
var effect_context: EffectContext
var event_manager := EventManager.new()

func _ready() -> void:
	init_top_piles()
	init_bottom_piles()
	init_discard_pile()
	deck.card_clicked.connect(on_card_clicked)
	deck.shuffle()
	effect_context = get_effect_context()
	deal()

func init_discard_pile() -> void:
	discard_pile.is_discard = true
	discard_pile.clicked.connect(on_discard_pile_clicked)
	discard_pile.is_board = true
	
func init_top_piles() -> void:
	top_piles = [top_pile1, top_pile2, top_pile3, top_pile4]
	for pile in top_piles:
		pile.set_has_validator(true)
	
func init_bottom_piles() -> void:
	piles = [pile1, pile2, pile3, pile4]
	for pile in top_piles:
		pile.is_board = true
		pile.clicked.connect(on_top_pile_clicked)
		pile.set_has_validator(false)
	 
func deal() -> void:
	for i in range(deck.cards.size()):
		var card = deck.deal()
		var pile = piles[i % piles.size()]
		pile.add(card)

func on_card_clicked(card: Card) -> void:
	var pile = card.get_parent()
	if pile.is_discard:
		on_discard_pile_clicked(pile)
		return
	if pile.is_board:
		on_top_pile_clicked(pile)
		return
	else:
		selected_card = card
	
func on_top_pile_clicked(pile: Pile) -> void:
	if selected_card and is_valid_move(pile.get_top_card()):
		sound.note_c()
		pile.add(selected_card)
		play_card(selected_card)
		selected_card = null

func on_discard_pile_clicked(pile: Pile) -> void:
	if selected_card:
		pile.add(selected_card)
		score.reset_combo()
		
func is_valid_move(top_card: Card) -> bool:
	if !top_card:
		return true
	var min = top_card.rank - 1
	var max = top_card.rank + 1
	if selected_card.rank >= min and selected_card.rank <= max:
		return true
	if selected_card.rank == Constants.HIGHEST_RANK and top_card.rank == Constants.LOWEST_RANK:
		return true
	if selected_card.rank == Constants.LOWEST_RANK and top_card.rank == Constants.HIGHEST_RANK:
		return true	
	return false
	
func get_effect_context() -> EffectContext:
	var effect_context = EffectContext.new()
	effect_context.score = score
	return effect_context
	
func play_card(card: Card) -> void:
	#Step 1 Card effect
	if card.resolver:
		card.resolver.resolve(effect_context)
	
	#Step 2: Passive Effects 
	event_manager.card_played(passives.all(), effect_context)
	
	#Step 3: Score
	score.add(card.rank)
