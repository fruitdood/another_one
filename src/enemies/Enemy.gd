extends KinematicBody


var path := []
var path_index := 0

var move_speed = 10
var health = 450

onready var nav : Navigation = get_parent()
onready var player : KinematicBody = $"../Player" #better way to get the player?
	
	
func _physics_process(_delta: float) -> void:
	if path_index < path.size():
		var direction = (path[path_index] - global_transform.origin)
		
		if direction.length() < 1:
			path_index += 1
		else:
			var _anus = move_and_slide(direction.normalized() * move_speed, Vector3.UP)
			$AnimationPlayer.play("WALK")
			
		direction.y = 0
		if direction:
			# Direction is relative, so apply it to the robot's location to
			# get a point we can actually look at.
			var look_at_point = self.translation + direction.normalized()
			$Rig.look_at(look_at_point, Vector3.UP)
			
			
func move_to(target_pos):
	path = nav.get_simple_path(global_transform.origin, target_pos)
	path_index = 0


func _on_AttackArea_body_entered(_body: Node) -> void:
	print("player is in attack area")


func _on_Timer_timeout() -> void:
	move_to(player.global_transform.origin)


func _on_DamageTakenArea_entered(area: Area) -> void:
	health -= area.projectile_damage
	
	if health <= 0:
		queue_free()
