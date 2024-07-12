extends Panel

class_name inv_ui

@onready var item_visual: Sprite2D = $CenterContainer/Panel/item_display
@onready var amount_text: Label = $CenterContainer/Panel/item_count

# To store item data
var current_item: InvItem = null
var current_amount: int = 0

# Reference to the inventory and the slot index
var inventory: Inv = null
var slot_index: int = -1
var source_slot: int = -1

# Preview when dragging objects in inv
func get_preview():
	var preview_texture = Sprite2D.new()
	preview_texture.texture = item_visual.texture
	preview_texture.scale = Vector2(2, 2)

	var preview = Control.new()
	preview.add_child(preview_texture)

	return preview

func update(slot: InvSlot, inv: Inv, index: int):
	inventory = inv
	slot_index = index
	current_item = slot.item
	current_amount = slot.amount
	update_visual()

func update_visual():
	if !current_item:
		item_visual.visible = false
		amount_text.visible = false
	else:
		item_visual.visible = true
		item_visual.texture = current_item.texture
		if current_amount > 1:
			amount_text.visible = true
			amount_text.text = str(current_amount)
		else:
			amount_text.visible = false

func update_inventory():
	if inventory and slot_index >= 0:
		inventory.slots[slot_index].item = current_item
		inventory.slots[slot_index].amount = current_amount

func _get_drag_data(at_position):
	set_drag_preview(get_preview())
	var drag_data = {
		"item": current_item,
		"amount": current_amount,
		"texture": item_visual.texture,
		"slot_index": slot_index
	}
	# Clear current slot
	current_item = null
	current_amount = 0
	item_visual.texture = null

	update_inventory()
	update_visual()
	return drag_data

func _can_drop_data(at_position, data):
	return data.has("item") and data.has("amount")

func _drop_data(at_position, data):
	# Temporary var for storage
	var temp_item = current_item
	var temp_amount = current_amount
	var temp_visual = item_visual.texture
	
	# Update current slot
	current_item = data["item"]
	current_amount = data["amount"]
	item_visual.texture = data["texture"]

	# If there's a source slot, swap the data
	if data.has("slot_index") and inventory:
		inventory.slots[data["slot_index"]].item = temp_item
		inventory.slots[data["slot_index"]].amount = temp_amount
		item_visual.texture = temp_visual
		update_visual()

	# Update the inventory and visuals
	update_inventory()
	update_visual()
	inventory.emit_signal("update")

# Function to print the slot's item
func print_slot():
	if current_item:
		print("Slot %d: Item: %s, Amount: %d" % [slot_index, current_item.name, current_amount])
	else:
		print("Slot %d: Empty" % [slot_index])
		
