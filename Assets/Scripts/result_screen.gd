extends Control

@export var result_screen : Control
@export var results_label : Label
@export var final_time_time : Label
@export var final_death_label : Label
@export var fake_retry_button : Button
@export var fake_quit_button : Button
@export var real_retry : Button
@export var real_quit : Button
@export var fake_quit_label : Label
@export var margin_container : MarginContainer

var stopwatch : Stopwatch
var hud : HUD
var html_ending : HTMLEnd

func _ready() -> void:
	stopwatch = get_tree().get_first_node_in_group("stopwatch")
	hud = get_tree().get_first_node_in_group("hud")
	html_ending = get_tree().get_first_node_in_group("html_ending")
	
	fake_quit_label.text = "Haha!! Nice try!"
	fake_quit_label.visible = false
	
	final_time_time.text = str(stopwatch.stop())
	final_death_label.text = "Deaths: " + str(GameManager.deaths)
	
	real_quit.visible = false
	real_retry.visible = false

func _on_fake_retry_button_pressed() -> void:
	GameManager.load_level(GameManager.current_level)

func _on_fake_quit_button_pressed() -> void:
	real_quit.visible = true
	real_retry.visible = true

func _on_retry_button_pressed() -> void:
	GameManager.load_level(GameManager.starting_level)

func _on_quit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/Menus/main_menu.tscn")
