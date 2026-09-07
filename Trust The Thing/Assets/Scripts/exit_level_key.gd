extends Area2D
class_name ExitLevelKey

@export var sprite : Sprite2D

func _on_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		GameManager.next_level()
