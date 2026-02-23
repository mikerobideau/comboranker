extends RefCounted
class_name PassiveFactory

var Passive = preload("res://object/effect/passive/passive.tscn")

func create(data: PassiveData) -> Passive:
	var passive = Passive.instantiate()
	passive.set_data(data)
	return passive
