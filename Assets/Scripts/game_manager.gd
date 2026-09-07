extends Node

signal area_stopped

var starting_level = 1
var current_level = 1
var level_path = "res://Assets/Scenes/Levels/"
var full_path = level_path + "level_" + str(current_level) + ".tscn"
var end_level = 3

var keys = 0
var deaths = 0

var level_container : Node2D
var player : PlayerController
var hud : HUD
var main_menu : MainMenu
var result_screen : Control

func _ready() -> void:
	pass

func start_game():
	current_level = starting_level
	
	get_tree().change_scene_to_file("res://Assets/Scenes/gameplay.tscn")
	await get_tree().scene_changed
	
	load_level(current_level)

func next_level():
	current_level += 1
	load_level(current_level)

func load_level(_level_number):
	level_container = get_tree().get_first_node_in_group("level_container")
	player = get_tree().get_first_node_in_group("player")
	hud = get_tree().get_first_node_in_group("hud")
	result_screen = get_tree().get_first_node_in_group("result_screen")
	
	result_screen.visible = false
	hud.visible = true
	
	# Checking the new scene path
	full_path = level_path + "level_" + str(current_level) + ".tscn"
	var scene = load(full_path) as PackedScene
	if !scene:
		return
	
	# Removing the previous scene
	for child in level_container.get_children():
		child.queue_free()
		await child.tree_exited
	
	# Setting up new scene
	var instance = scene.instantiate()
	level_container.add_child(instance)
	reset_keys()
	
	# Moving the player to the start of the new scene
	var player_start_position = get_tree().get_first_node_in_group("player_start_position") as Node2D
	player.teleport_to_location(player_start_position.position)

func end_game():
	result_screen = get_tree().get_first_node_in_group("result_screen")
	var end_level_path = level_path + "level_" + str(end_level) + ".tscn"
	if end_level_path == full_path:
		area_stopped.emit()

func add_keys():
	keys += 1
	hud.update_keys_label(keys)
	
	if keys >= 1:
		var door = get_tree().get_first_node_in_group("exit_level") as ExitLevel
		door.open()
		hud.door_opened()

func reset_keys():
	keys = 0
	hud.update_keys_label(keys)
	hud.door_closed()

func count_deaths():
	deaths += 1
	hud.update_deaths_label(deaths)

func punish_inputs():
	# Reset to the current level
	load_level(current_level)
	count_deaths()
