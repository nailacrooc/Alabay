extends Sprite2D

@onready var fishskin: Node2D = $"../../Lapnos/FishSkin(tilapia)"
@onready var I_lapnos: Node2D = $"."

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

	if fishskin is Node2D:
		set_process_input(true)
	else:
		I_lapnos.self_modulate = Color(0.5, 0.5, 0.5)

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			show_ailment("Lapnos")
		else:
			print("Mouse clicked outside, no action taken")

func show_ailment(name):
	for ailment in ailments:
		if ailment.name == name:
			ailment.show()
		else:
			ailment.hide()
