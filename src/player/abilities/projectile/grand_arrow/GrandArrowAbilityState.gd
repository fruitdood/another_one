class_name GrandArrowAbilityState
extends State

var grand_arrow : GrandArrowAbility


func _ready() -> void:
	yield(owner, "ready")
	
	grand_arrow = owner as GrandArrowAbility
	
	assert(grand_arrow != null)

