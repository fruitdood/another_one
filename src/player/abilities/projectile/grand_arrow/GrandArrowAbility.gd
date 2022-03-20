class_name GrandArrowAbility
extends Position3D

signal casting
signal casting_finished

export var casting_time := 3.0
export var cooldown_time := 5.0

export(PackedScene) var GrandArrowProjectile
export(PackedScene) var GrandArrowCastParticles
export(PackedScene) var GrandArrowBurstParticles

var can_cast := true
var is_casting := false

onready var cast_timer = $CastTimer
onready var cooldown_timer = $CooldownTimer


func _ready() -> void:
	cast_timer.wait_time = casting_time
	cooldown_timer.wait_time = cooldown_time
	
	cast_timer.connect("timeout", self, "_on_CastTimer_timeout")
	cooldown_timer.connect("timeout", self, "_on_CooldownTimer_timeout")
	
	
func _on_CastTimer_timeout() -> void:
	is_casting = false
	
	
func _on_CooldownTimer_timeout() -> void:
	can_cast = true
	print("can_cast")
