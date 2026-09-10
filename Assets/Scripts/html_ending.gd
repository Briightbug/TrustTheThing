extends Area2D
class_name HTMLEnd

@export var html_end_text : Label

var stopwatch : Stopwatch

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED

func _on_body_entered(body: Node2D) -> void:
	stopwatch = get_tree().get_first_node_in_group("stopwatch")
	
	# Pauses the game when reached the goal in the final level
	if body is PlayerController:
		get_tree().paused = true
		if get_tree().paused == true:
			stopwatch.stop()
		
		GameManager.result_screen.visible = true
		GameManager.hud.visible = false
