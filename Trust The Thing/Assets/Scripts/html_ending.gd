extends Area2D
class_name HTMLEnd

@export var html_end_text : Label

var stopwatch : Stopwatch

var paused = false

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED

func _on_body_entered(body: Node2D) -> void:
	stopwatch = get_tree().get_first_node_in_group("stopwatch")
	
	# Pauses the game when reached the goal in the final level
	if body is PlayerController and paused == false:
		html_end_text.text = "You won!"
		paused = true
		get_tree().paused = true
		
		if paused == true:
			stopwatch.stopped = true
		
		var result_screen_path = "res://Assets/Scenes/Menus/result_screen.tscn"
		get_tree().call_deferred("change_scene_to_file", result_screen_path)
		
		#get_tree().change_scene_to_file("res://Assets/Scenes/Menus/main_menu.tscn")

func _input(event: InputEvent) -> void:
	# Unpauses the game on a button press
	if event.is_action_pressed("Resume Game") and paused == true:
		get_tree().paused = false
		paused = false

func _on_body_exited(body: Node2D) -> void:
	if body is PlayerController:
		html_end_text.text = ""
