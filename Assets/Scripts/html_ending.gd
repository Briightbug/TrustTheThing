extends Area2D
class_name HTMLEnd

@export var html_end_text : Label

var stopwatch : Stopwatch
var result_screen : Result

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED

func _on_body_entered(body: Node2D) -> void:
	stopwatch = get_tree().get_first_node_in_group("stopwatch")
	result_screen = get_tree().get_first_node_in_group("result_screen")
	
	# Pauses the game when reached the goal in the final level
	if body is PlayerController:
		stopwatch.stop()
		
		GameManager.result_screen.visible = true
		GameManager.hud.visible = false
		
		if GameManager.result_screen.visibility_changed:
			# Unpause the result screen to make the buttons work
			pass
