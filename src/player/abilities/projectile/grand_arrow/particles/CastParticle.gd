extends Spatial


signal change_state

export(NodePath) onready var anim_player = get_node(anim_player) as AnimationPlayer

onready var anim_time = $AnimationPlayer.current_animation_length


#func _ready() -> void:
#	anim_player.playback_speed += cooldown_reduction

	
	
func cast_particle_ends() -> void:
	emit_signal("change_state")
	
