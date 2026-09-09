extends Control
class_name HUD

@export var keys_label : Label
@export var door_label : Label
@export var deaths_label : Label
@export var stopwatch_label : Label

var stopwatch : Stopwatch

func _ready() -> void:
	stopwatch = get_tree().get_first_node_in_group("stopwatch")

func _process(_delta: float) -> void:
	update_stopwatch_label()

func update_keys_label(number : int):
	keys_label.text = "x " + str(number)

func door_opened():
	door_label.text = "Door open!"

func door_closed():
	door_label.text = "Door closed..."

func update_deaths_label(number : int):
	deaths_label.text = "Deaths: " + str(number)

func update_stopwatch_label():
	stopwatch_label.text = stopwatch.time_to_string()
