extends Control
class_name MainMenu

@export var initial_scene : StringName = &""
@export var main_buttons : VBoxContainer
@export var start_button : Button
@export var options_button : Button
@export var exit_button : Button
@export var options_panel : Panel

func _ready() -> void:
	main_buttons.visible = true
	options_panel.visible = false

func _on_start_button_pressed() -> void:
	SceneLoader.load_scene(initial_scene)
	await SceneLoader.load_finished
	GameManager.start_game()

func _on_options_button_pressed() -> void:
	main_buttons.visible = false
	options_panel.visible = true


func _on_exit_button_pressed() -> void:
	# Quits the game in main menu to desktop
	get_tree().quit()


func _on_back_pressed() -> void:
	options_panel.visible = false
	main_buttons.visible = true
