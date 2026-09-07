extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.load_level(GameManager.current_level)
		GameManager.count_deaths()
