extends Node2D
class_name Stopwatch

var time = 0.0
var stopped = false

var hud : HUD

func _ready() -> void:
	GameManager.area_stopped.connect(stop)

func _process(delta: float):
	if stopped:
		return
	time += delta

func stop():
	hud.stopwatch_label.text = time

func time_to_string() -> String:
	# Turn the time var into a string for UI display
	var millisecond = fmod(time, 1) * 1000
	var second = fmod(time, 60)
	var minute = time / 60
	# Formatting time to look like 00:00:000
	var format_string = "%02d : %02d : %02d"
	var actual_string = format_string % [minute, second, millisecond]
	return actual_string
