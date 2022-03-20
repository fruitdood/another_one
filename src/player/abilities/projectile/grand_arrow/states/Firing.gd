extends GrandArrowAbilityState


func enter(_msg := {}) -> void:
	print("ENTERED THE FIRING STATE")
	_setup_grand_arrow()
	
	state_machine.transition_to("Idle")
	
	
func exit() -> void:
	pass


func _setup_grand_arrow() -> void:
	_instance_grand_arrow_projectile()
	_instance_grand_arrow_burst_particles()
	
	
func _instance_grand_arrow_projectile() -> void:
	grand_arrow.emit_signal("casting_finished") # connected in the Player script
	
	var grand_arrow_projectile_instance = grand_arrow.GrandArrowProjectile.instance()
	owner.owner.owner.add_child(grand_arrow_projectile_instance)
	grand_arrow_projectile_instance.transform = grand_arrow.global_transform
	grand_arrow_projectile_instance.velocity = -grand_arrow_projectile_instance.transform.basis.z * grand_arrow_projectile_instance.projectile_speed


func _instance_grand_arrow_burst_particles() -> void:
	var grand_arrow_burst_particle_instance = grand_arrow.GrandArrowBurstParticles.instance()
	owner.owner.owner.add_child(grand_arrow_burst_particle_instance)
	grand_arrow_burst_particle_instance.global_transform = grand_arrow.global_transform
