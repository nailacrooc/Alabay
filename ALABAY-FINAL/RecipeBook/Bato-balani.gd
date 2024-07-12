extends Sprite2D

@onready var batobalani: Node2D = $"../../Snake Bite/Bato-balani"
@onready var eucalyptus: Node2D = $"../../Snake Bite/EucalyptusOil"
@onready var I_snakebite: Node2D = $"."

var ailments = []

func _ready():
	ailments = [
		$"../../ingredients/Insomnia",
		$"../../ingredients/Pananakit ng Tiyan",
		$"../../ingredients/Pananakit ng Kasu-kasuan",
		$"../../ingredients/Allergy",
		$"../../ingredients/Snake Bite",
		$"../../ingredients/Lapnos"
	]

	for ailment in ailments:
		ailment.hide()

	if batobalani is Node2D and eucalyptus is Node2D:
		set_process_input(true)
	else:
		I_snakebite.self_modulate = Color(0.5, 0.5, 0.5)

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			show_ailment("Snake Bite")
		else:
			print("Mouse clicked outside, no action taken")

func show_ailment(name):
	for ailment in ailments:
		if ailment.name == name:
			ailment.show()
		else:
			ailment.hide()
