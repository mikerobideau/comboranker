extends RefCounted
class_name CardFactory

var CardScene = preload("res://object/card/card.tscn")

func create(data: CardData) -> Card:
	var card = CardScene.instantiate()
	card.set_data(data)
	return card
