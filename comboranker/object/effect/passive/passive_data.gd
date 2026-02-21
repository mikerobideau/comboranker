extends Resource
class_name PassiveData

enum Trigger {
	CardPlayed
}

@export var name: String
@export var trigger: Trigger
@export var resolver: Resolver
