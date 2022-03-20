extends GrandArrowAbilityState


func handled_input(_event: InputEvent) -> void:
	if _event.is_action_pressed("W") and grand_arrow.can_cast:
		state_machine.transition_to("Casting")

	
func update(_delta: float) -> void:
	pass
	
	
func physics_update(_delta: float) -> void:
	pass
	
	
func enter(_msg := {}) -> void:
	print("ENTERED THE IDLE STATE")
	
	
func exit() -> void:
	pass
