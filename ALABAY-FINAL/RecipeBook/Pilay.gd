extends Sprite2D

@onready var camphor: Node2D = $"../../Pilay/Camphor"
@onready var eucalyptus: Node2D = $"../../Pilay/Eucalyptus"
@onready var mint: Node2D = $"../../Pilay/Mint"
@onready var I_pilay: Node2D = $"."

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

	if camphor is Node2D and eucalyptus is Node2D and mint is Node2D:
		set_process_input(true)
	else:
		I_pilay.self_modulate = Color(0.5, 0.5, 0.5)

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			show_ailment("Pilay")

func show_ailment(name):
	for ailment in ailments:
		if ailment.name == name:
			ailment.show()
		else:
			ailment.hide()

