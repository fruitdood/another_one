extends GrandArrowAbilityState


func handled_input(_event: InputEvent) -> void:
	if _event.is_action_pressed("W"):
		if !grand_arrow.is_casting and !grand_arrow.is_on_cd: 
			state_machine.transition_to("Casting")

	
func enter(_msg := {}) -> void:
	print("ENTERED THE IDLE STATE")
	
	
func exit() -> void:
	pass
