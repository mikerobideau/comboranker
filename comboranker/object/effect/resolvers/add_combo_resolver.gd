extends Resolver
class_name AddComboResolver

@export var amount: int

func resolve(context: EffectContext) -> void:
	context.score.add_combo(amount)
