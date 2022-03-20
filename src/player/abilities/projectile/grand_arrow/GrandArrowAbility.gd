class_name GrandArrowAbility
extends Position3D


var is_casting := false 
var is_on_cd := false

export(NodePath) onready var cast_particles = get_node(cast_particles) as Spatial
