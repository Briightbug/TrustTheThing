extends CharacterBody2D
class_name PlayerController

@export var move_speed = 10.0
@export var jump_strength = 8.0
@export var camera : Camera2D
@export var sprite : Sprite2D

var direction = 0
var speed_multiplier = 16.0
var jump_multiplier = -30.0
var jump_count = 0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _input(event: InputEvent) -> void:
	# Handle jump.
	if event.is_action_pressed("Jump") and is_on_floor():
		velocity.y = jump_strength * jump_multiplier
		jump_count += 1
	
	# Handle double jump
	if event.is_action_pressed("Jump") && !is_on_floor() && jump_count <= 1:
		velocity.y = jump_strength * jump_multiplier
		jump_count = 2
	elif is_on_floor() and event.is_action_pressed("Jump"):
		jump_count = 0
	
	# Punish the player for the use of 'normal' inputs
	# Build distrust
	if event.is_action_pressed("Fake_Left") or event.is_action_pressed("Fake_Right") or event.is_action_pressed("Fake_Jump"):
		GameManager.punish_inputs()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if !is_on_floor():
		velocity.y += gravity * delta

	# Get the input direction and handle the movement.
	direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * move_speed * speed_multiplier
	else:
		velocity.x = move_toward(velocity.x, 0, move_speed)

	move_and_slide()

#func _on_land():
	## Squish the sprite, then spring back
	#sprite.scale = Vector2(1.4, 0.8)
	#var tween = create_tween()
	#tween.tween_property(sprite, "scale", Vector2.ZERO, 0.2).set_trans(Tween.TRANS_ELASTIC)


func teleport_to_location(new_location):
	position = new_location
	camera.reset_smoothing()
