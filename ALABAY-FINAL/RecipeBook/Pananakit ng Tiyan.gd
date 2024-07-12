extends Sprite2D

@onready var papaya: Node2D = $"../../Pananakit ng Tiyan/Papaya"
@onready var coconutmilk: Node2D = $"../../Pananakit ng Tiyan/Coconut-milk"
@onready var I_tiyan: Node2D = $"."

var ailments = []

func _ready():
	ailments = [
		$"../../ingredients/Insomnia",
		$"../../ingredients/Pananakit ng Tiyan",
		$"../../ingredients/Pananakit ng Kasu-kasuan",
		$"../../ingredients/Allergy",
		$"../../ingredients/Lapnos",
		$"../../ingredients/Snake Bite"
	]

	for ailment in ailments:
		ailment.hide()

	if papaya is Node2D and coconutmilk is Node2D:
		set_process_input(true)
	else:
		I_tiyan.self_modulate = Color(0.5, 0.5, 0.5)

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			show_ailment("Pananakit ng Tiyan")

func show_ailment(name):
	for ailment in ailments:
		if ailment.name == name:
			ailment.show()
		else:
			ailment.hide()
