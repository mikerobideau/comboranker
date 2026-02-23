extends Resource
class_name PassiveData

enum Trigger {
	CARD_PLAYED
}

@export var name: String
@export var trigger: Trigger
@export var resolver: Resolver
