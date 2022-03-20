extends KinematicBody


export var show_path := true
export(NodePath) onready var camera = get_node(camera) as Camera
export(PackedScene) onready var Arrow

var move_speed := 15.0
var can_walk := true

var mouse_pos := Vector3(0, 1, 0)
var ray_origin := Vector3()
var ray_end := Vector3()

var nav : Navigation
var space_state : PhysicsDirectSpaceState
var path := []
var path_index := 0
var target_point 


func _ready() -> void:
	if owner:
		yield(owner, "ready") #waiting for ready function of the owner to be loaded
		nav = owner.navigation
	else:
		print("no nav")
		
	$Rig/GrantArrowAbility.connect("casting", self, "_on_casting")
	$Rig/GrantArrowAbility.connect("casting_finished", self, "_on_casting_finished")

	
	
func _on_casting():
	print("is casting")
	path = []
	can_walk = false
	target_point.y = self.translation.y
	$Rig.look_at(target_point, Vector3.UP)
	

func _on_casting_finished():
	print("should walk again")
	can_walk = true


func _unhandled_input(event):
	if event is InputEventMouseMotion:
		var from = camera.project_ray_origin(event.position)
		var to = from + camera.project_ray_normal(event.position) * 1000
		target_point = nav.get_closest_point_to_segment(from, to)
		
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed and can_walk:
		path = nav.get_simple_path(self.translation, target_point, true)
		

func _physics_process(delta: float) -> void:
	var direction = Vector3()

	var step_size = delta * move_speed

	if path.size() > 0:
		var destination = path[0]
		direction = destination - self.translation

		if step_size > direction.length():
			step_size = direction.length()
			path.remove(0)

		self.translation += move_and_slide(direction.normalized() * step_size)

		direction.y = 0
		if direction:
			var look_at_point = self.translation + direction.normalized()
			$Rig.look_at(look_at_point, Vector3.UP)
