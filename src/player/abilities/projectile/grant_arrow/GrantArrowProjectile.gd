#only handles the logic for the projectile
extends ProjectileBase


func _physics_process(delta: float) -> void:
	if apply_gravity:
		velocity += projectile_gravity * delta 
	look_at(transform.origin + velocity.normalized(), Vector3.UP)
	transform.origin += velocity * delta


func _on_GrantArrow_area_entered(area: Area) -> void:
	_die()


func _on_GrantArrow_body_entered(body: Node) -> void:
	_die()
