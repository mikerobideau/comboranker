extends MarginContainer
class_name Passives

@onready var hbox = $HBox

var snake_eyes = preload("res://resource/passive/snake_eyes.tres")
var passives: Array[PassiveData]
var factory = PassiveFactory.new()

func _ready() -> void:
	passives = []
	populate()
	
func populate() -> void:
	for data in passives:
		var scene = factory.create(data)
		hbox.add_child(scene)

func all() -> Array[Passive]:
	var passives: Array[Passive] = []
	for child in hbox.get_children():
		passives.append(child as Passive)
	return passives
