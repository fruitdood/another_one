extends GrantArrowAbilityState


func enter(_msg := {}) -> void:
	print("ENTERED THE FIRING STATE")
	
	grant_arrow.emit_signal("casting_finished")
	
	var grant_arrow_instance = grant_arrow.GrantArrow.instance()
	owner.owner.owner.add_child(grant_arrow_instance)
	grant_arrow_instance.transform = grant_arrow.global_transform
	grant_arrow_instance.velocity = -grant_arrow_instance.transform.basis.z * grant_arrow_instance.projectile_speed
	
	state_machine.transition_to("Idle")
	
	
	
func exit() -> void:
	pass
