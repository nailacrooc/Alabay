extends Sprite2D

@onready var bayabas: Node2D = $"../../Fever/Bayabas"
@onready var sambong: Node2D = $"../../Fever/Sambong"
@onready var I_fever: Node2D = $"."
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

	if bayabas is Node2D and sambong is Node2D:
		set_process_input(true)
	else:
		I_fever.self_modulate = Color(0.5, 0.5, 0.5)

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			show_ailment("Fever")

func show_ailment(name):
	for ailment in ailments:
		if ailment.name == name:
			ailment.show()
		else:
			ailment.hide()

