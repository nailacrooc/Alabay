extends Node2D

@onready var canvas_layer = $"UI Canvas"
@onready var canvas_modulate = $CanvasModulate
@onready var ui = $"UI Canvas/DayNightCycleUI"

func _ready() -> void:
	canvas_layer.visible = true
	canvas_modulate.time_tick.connect(ui.set_daytime)





