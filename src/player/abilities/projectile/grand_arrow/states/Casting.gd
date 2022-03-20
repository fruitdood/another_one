extends GrandArrowAbilityState


var grand_arrow_cast_particle_instance


func handle_input(_event: InputEvent) -> void:
	pass

	
func update(_delta: float) -> void:
	pass
	
	
func physics_update(_delta: float) -> void:
	pass
	
	
func enter(_msg := {}) -> void:
	print("ENTERED THE CASTING STATE")
	_setup_grand_arrow()
	
	
	
	
func exit() -> void:
	grand_arrow_cast_particle_instance.queue_free()


func _setup_grand_arrow() -> void:
	grand_arrow.emit_signal("casting")

	grand_arrow.can_cast = false
	grand_arrow.is_casting = true
	
	grand_arrow.cast_timer.start()
	grand_arrow.cooldown_timer.start()
	
#	grand_arrow_particle_instance = grand_arrow.GrandArrowParticles.instance()
	grand_arrow_cast_particle_instance = grand_arrow.GrandArrowCastParticles.instance()
	owner.add_child(grand_arrow_cast_particle_instance)
	grand_arrow_cast_particle_instance.global_transform = owner.global_transform
	grand_arrow_cast_particle_instance.em


func _on_CastTimer_timeout() -> void:
	state_machine.transition_to("Firing")



