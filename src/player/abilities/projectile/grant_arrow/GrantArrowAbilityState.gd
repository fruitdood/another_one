class_name GrantArrowAbilityState
extends State

var grant_arrow : GrantArrowAbility


func _ready() -> void:
	yield(owner, "ready")
	
	grant_arrow = owner as GrantArrowAbility
	
	assert(grant_arrow != null)

