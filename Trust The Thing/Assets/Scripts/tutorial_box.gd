extends Area2D
class_name TutorialBox

@export var fade_in_time = 1.0
@export var fade_in_time_loop = 0.5
@export var tutorial_text : Label
@export var tween_ease : Tween.EaseType
@export var transition : Tween.TransitionType

func _on_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		tutorial_text.text = "Press [A] or [D] to walk"
	if GameManager.deaths >= 1:
		tutorial_text.text = "Just joking... It's [Space] maybe..."
	if GameManager.deaths >= 2:
		tutorial_text.text = "Or not, it might be [L] and [Apostrophe/Ä]! Good luck!"
		move_tween()

func move_tween():
	var tween = get_tree().create_tween()
	tween.set_loops(1)
	tween.tween_property(tutorial_text, "modulate:a", 1.0, fade_in_time).from(0.0)
	tween.tween_await(body_exited)
	tween.set_loops()
	tween.tween_property(tutorial_text, "modulate:a", 0.0, fade_in_time_loop).set_ease(tween_ease).set_trans(transition)
	tween.tween_property(tutorial_text, "modulate:a", 1.0, fade_in_time_loop).set_ease(tween_ease).set_trans(transition)


func _on_body_exited(body: Node2D) -> void:
	if body is PlayerController:
		tutorial_text.text = "Trust No One!!!"
