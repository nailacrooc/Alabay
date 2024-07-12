extends Sprite2D

@onready var oregano: Node2D = $"../../Sipon/Oregano"
@onready var lemon: Node2D = $"../../Sipon/Lemon"
@onready var I_sipon: Node2D = $"."

var ailments = []

func _ready():
	ailments = [
		$"../../ingredients/SoreThroat",
		$"../../ingredients/Wound",
		$"../../ingredients/Asthma",
		$"../../ingredients/Fever",
		$"../../ingredients/Dengue",
		$"../../ingredients/Highbood",
		$"../../ingredients/Balisawsaw",
		$"../../ingredients/Pilay",
		$"../../ingredients/Headache",
		$"../../ingredients/Sipon",
		$"../../ingredients/Pagsusuka",
		$"../../ingredients/Pamamantal"
	]

	for ailment in ailments:
		ailment.hide()

	if oregano is Node2D and lemon is Node2D:
		set_process_input(true)
	else:
		I_sipon.self_modulate = Color(0.5, 0.5, 0.5)

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			show_ailment("Sipon")

func show_ailment(name):
	for ailment in ailments:
		if ailment.name == name:
			ailment.show()
		else:
			ailment.hide()

