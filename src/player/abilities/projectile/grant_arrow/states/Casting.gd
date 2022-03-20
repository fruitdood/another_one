extends GrantArrowAbilityState


func handle_input(_event: InputEvent) -> void:
	pass

	
func update(_delta: float) -> void:
	pass
	
	
func physics_update(_delta: float) -> void:
	pass
	
	
func enter(_msg := {}) -> void:
	print("ENTERED THE CASTING STATE")
	
	print(owner.name)
	grant_arrow.emit_signal("casting")

	grant_arrow.can_cast = false
	grant_arrow.is_casting = true
	
	grant_arrow.cast_timer.start()
	grant_arrow.cooldown_timer.start()
	
	var grant_arrow_particle_instance = grant_arrow.GrantArrowParticles.instance()
	owner.add_child(grant_arrow_particle_instance)
	grant_arrow_particle_instance.translation = owner.translation
	
	
func exit() -> void:
	pass


func _on_CastTimer_timeout() -> void:
	state_machine.transition_to("Firing")
