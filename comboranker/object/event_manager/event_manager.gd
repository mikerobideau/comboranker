extends RefCounted
class_name EventManager

func get_passives_by_trigger(passives: Array[Passive], trigger: PassiveData.Trigger) -> Array[Passive]:
	var filtered: Array[Passive] = []
	for passive in passives:
		if passive.data.trigger == trigger:
			filtered.append(passive)
	return filtered

func card_played(passives: Array[Passive], context: EffectContext) -> void:
	var filtered = get_passives_by_trigger(passives, PassiveData.Trigger.CARD_PLAYED)
	for passive in filtered:
		resolve_passive(passive, context)
		
func resolve_passive(passive: Passive, context: EffectContext) -> void:
	passive.data.resolver.resolve(context)
