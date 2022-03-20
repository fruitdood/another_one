extends Spatial


export var cooldown_reduction = 0.0

var time := 0.0


func _ready() -> void:
	$AnimationPlayer.play("CHARGE")
	$AnimationPlayer.playback_speed += cooldown_reduction
	print($AnimationPlayer.playback_speed)
	
	
func _process(delta: float) -> void:
	time += delta
	
	
func get_time() -> float:
	return time
	
	
func _delete_particle() -> void:
	print(get_time())
	queue_free()
