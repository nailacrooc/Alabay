extends Control

#Fields
var is_open = false
@onready var inv: Inv = preload("res://Player/Inventory/playerinv.tres")
@onready var slots: Array = $GridContainer.get_children()

func _ready():
	inv.update.connect(update_slots)
	update_slots()
	open()

#Update the slots
func update_slots():
	for i in range(min(inv.slots.size(), slots.size())):
		slots[i].update(inv.slots[i], inv, i)

func _process(delta):
	if Input.is_action_just_pressed("inventory"):
		if is_open:
			close()
		else:
			open()


func open():
	visible = true
	is_open = true

func close():
	visible = false
	is_open = false

func _on_inv_ui_inv_close():
	open()

func _on_inv_ui_inv_open():
	close()
