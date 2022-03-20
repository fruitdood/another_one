extends Area
class_name ProjectileBase


export var projectile_damage := 75.0
export var projectile_speed := 150.0
export var projectile_gravity = Vector3.DOWN * 20

export var apply_gravity := false

var velocity := Vector3.ZERO

onready var collision_shape = $CollisionShape
onready var mesh_instance = $MeshInstance
	

func _ready() -> void:
	$DeletionTimer.connect("timeout", self, "_on_DeletionTimer_timeout")
	
	
func _die() -> void:
	print("projectile hit")
	queue_free()


func _on_DeletionTimer_timeout() -> void:
	_die()
