extends GrandArrowAbilityState


	
func enter(_msg := {}) -> void:
	print("ENTERED THE CASTING STATE")
	grand_arrow.cast_particles.anim_player.play("CAST")
	grand_arrow.cast_particles.connect("change_state", self, "_on_change_state")


func _on_change_state() -> void:
	state_machine.transition_to("Firing")
	

func _setup_grand_arrow() -> void:
	grand_arrow.emit_signal("casting") # connected to the player itself

	grand_arrow.can_cast = false # while casting cant cast
	grand_arrow.is_casting = true
	
#	grand_arrow.cast_timer.start()
#	grand_arrow.cooldown_timer.start()
	

#func _on_cast_particle_ends() -> void:
#	state_machine.transition_to("Firing")
