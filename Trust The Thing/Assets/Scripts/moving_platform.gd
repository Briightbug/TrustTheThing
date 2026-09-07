extends Path2D
class_name MovingPlatformSmall

@export var ratio_up = 1.0
@export var ratio_down = 0.0
@export var path_time = 1.0
@export var looping = false
@export var tween_ease : Tween.EaseType
@export var transition : Tween.TransitionType
@export var path_follow_2D : PathFollow2D

var looping_transition_time = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	move_tween()

func move_tween():
	var tween = get_tree().create_tween().set_loops()
	tween.tween_property(path_follow_2D, "progress_ratio", ratio_down, path_time).set_ease(tween_ease).set_trans(transition)
	
	if  !looping:
		tween.tween_property(path_follow_2D, "progress_ratio", ratio_up, path_time).set_ease(tween_ease).set_trans(transition)
	else:
		tween.tween_property(path_follow_2D, "progress_ratio", ratio_down, looping_transition_time).set_ease(tween_ease).set_trans(transition)
