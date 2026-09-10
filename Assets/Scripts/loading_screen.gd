extends CanvasLayer

signal loading_screen_ready

@export var animation_player : AnimationPlayer
@export var progress_bar : ProgressBar

func _ready() -> void:
	await animation_player.animation_finished
	loading_screen_ready.emit()

func _on_progress_changed(new_value : float):
	var tween = create_tween()
	new_value = progress_bar.min_value
	tween.tween_property(progress_bar, "value", new_value, 0.0)
	new_value = progress_bar.max_value
	tween.tween_property(progress_bar, "value", new_value, animation_player.current_animation_length)

func _on_load_finished() -> void:
	animation_player.play_backwards("transition")
	await animation_player.animation_finished
	queue_free()
