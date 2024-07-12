extends Node2D

@onready var canvas_modulate = $CanvasModulate
@onready var ui = $"UI Canvas/DayNightCycleUI"

func _ready() -> void:
	canvas_modulate.time_tick.connect(ui.set_daytime)
	GlobalAudioStreamPlayer.current_scene = "house_inside"


