extends Sprite2D

@onready var rambutan: Node2D = $"../../Allergy/Rambutan"
@onready var honey: Node2D = $"../../Allergy/Honey"
@onready var I_allergy: Node2D = $"."

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

	if rambutan is Node2D and honey is Node2D:
		set_process_input(true)
	else:
		I_allergy.self_modulate = Color(0.5, 0.5, 0.5)

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			show_ailment("Allergy")
		else:
			print("Mouse clicked outside, no action taken")

func show_ailment(name):
	for ailment in ailments:
		if ailment.name == name:
			ailment.show()
		else:
			ailment.hide()
