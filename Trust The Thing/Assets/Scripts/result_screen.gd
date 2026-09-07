extends Control

@export var results_label : Label
@export var final_time_time : Label
@export var final_death_label : Label
@export var fake_retry_button : Button
@export var fake_quit_button : Button
@export var real_retry : Button
@export var real_quit : Button

func _ready() -> void:
	final_death_label.text = "Deaths: " + str(GameManager.deaths)

func _on_fake_retry_button_pressed() -> void:
	results_label.text = "Ha! Fooled you!"


func _on_fake_quit_button_pressed() -> void:
	# Loads the level at random between first and last
	GameManager.load_level(randi_range(GameManager.starting_level, GameManager.end_level))


func _on_retry_button_pressed() -> void:
	GameManager.load_level(GameManager.starting_level)


func _on_quit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/Menus/main_menu.tscn")
