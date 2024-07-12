extends Sprite2D

@onready var banana: Node2D = $"../../Wound/Banana"
@onready var lemon: Node2D = $"../../Wound/Lemon"
@onready var I_wound: Node2D = $"."
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

	if banana is Node2D and lemon is Node2D:
		set_process_input(true)
	else:
		I_wound.self_modulate = Color(0.5, 0.5, 0.5)

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			show_ailment("Wound")

func show_ailment(name):
	for ailment in ailments:
		if ailment.name == name:
			ailment.show()
		else:
			ailment.hide()

