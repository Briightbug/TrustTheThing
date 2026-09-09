extends Node2D

@export var player_controller : PlayerController
@export var animation_player : AnimationPlayer
@export var sprite_2d : Sprite2D

func _process(_delta: float) -> void:
	# Flips character sprite
	if player_controller.direction == 1:
		sprite_2d.flip_h = false
	elif player_controller.direction == -1:
		sprite_2d.flip_h = true
	
	# Plays movement animation
	if abs(player_controller.velocity.x) > 0.0:
		animation_player.play("move")
	else:
		animation_player.play("idle")
	
	# Plays jump animation
	if player_controller.velocity.y < 0.0:
		animation_player.play("jump")
	elif player_controller.velocity.y > 0.0:
		animation_player.play("fall")
