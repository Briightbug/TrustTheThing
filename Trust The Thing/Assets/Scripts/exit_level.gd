extends Area2D
class_name ExitLevel

@export var sprite : Sprite2D

var is_open = false

func open():
	# open the door
	is_open = true
	sprite.region_rect.position.x = 16

func close():
	# close the door
	is_open = false
	sprite.region_rect.position.x = 0

func _on_body_entered(body: Node2D) -> void:
	if is_open && body is PlayerController:
		GameManager.next_level()
