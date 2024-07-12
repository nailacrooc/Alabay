extends Sprite2D

@onready var aloevera: Node2D = $"../../Pamamantal/AloeVera"
@onready var tulsi: Node2D = $"../../Pamamantal/Tulsi"
@onready var I_pamamantal: Node2D = $"."

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

	if aloevera is Node2D and tulsi:
		set_process_input(true)
	else:
		I_pamamantal.self_modulate = Color(0.5, 0.5, 0.5)

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			show_ailment("Pamamantal")

func show_ailment(name):
	for ailment in ailments:
		if ailment.name == name:
			ailment.show()
		else:
			ailment.hide()

