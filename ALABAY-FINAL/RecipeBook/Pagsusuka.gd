extends Sprite2D

@onready var papaya: Node2D = $"../../Pagsusuka/Chico"
@onready var lemon: Node2D = $"../../Pagsusuka/Lemon" 
@onready var I_pagsusuka: Node2D = $"."
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
		$"../../ingredients/Pananakit ng Tiyan",
		$"../../ingredients/Pagsusuka",
		$"../../ingredients/Headache"
	]

	for ailment in ailments:
		ailment.hide()

	if papaya is Node2D and lemon is Node2D:
		set_process_input(true)
	else:
		I_pagsusuka.self_modulate = Color(0.5, 0.5, 0.5)

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			show_ailment("Pagsusuka")

func show_ailment(name):
	for ailment in ailments:
		if ailment.name == name:
			ailment.show()
		else:
			ailment.hide()
