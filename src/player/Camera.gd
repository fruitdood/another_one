extends Camera


export var min_zoom := 10.0
export var max_zoom := 30.0
export var zoom_factor := 5.0
export var zoom_duration := 0.4

var _zoom_level := 1.0 setget _set_zoom_level

onready var tween: Tween = $Tween


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("zoom_in"):
		_set_zoom_level(_zoom_level - zoom_factor)
	elif event.is_action_pressed("zoom_out"):
		_set_zoom_level(_zoom_level + zoom_factor)


func _set_zoom_level(value: float) -> void:
	_zoom_level = clamp(value, min_zoom, max_zoom)
	
	tween.interpolate_property(
		self,
		"translation:z",
		self.translation.z,
		_zoom_level,
		zoom_duration,
		tween.TRANS_SINE,
		tween.EASE_OUT
	)
	tween.start()
