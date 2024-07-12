extends Resource

class_name Inv

signal update

@export var slots: Array[InvSlot]

func insert(item: InvItem):
	var itemslots = slots.filter(func(slot): return slot.item == item) #checks if the item in the slot is the same as the item we're trying to add
	if !itemslots.is_empty(): #If there is nothing in the slots
		itemslots[0].amount += 1 #adds the item to the existing slot
	else:
		var emptyslots = slots.filter (func(slot): return slot.item == null) #checks if the item in the slot is NOT the same as the item we're trying to add
		if !emptyslots.is_empty(): #checks for an empty slot
			emptyslots[0].item = item #sets the item
			emptyslots[0].amount = 1 #sets the amount of the item
	update.emit()

func get_item_count(item: InvItem):
	var count = 0
	for slot in slots:
		if slot.item == item:
			count += slot.amount
	return count

func remove_items(item: InvItem, amount: int):
	var remaining = amount
	for slot in slots:
		if slot.item == item:
			if slot.amount > remaining:
				slot.amount -= remaining
				remaining = 0
				break
			else:
				remaining -= slot.amount
				slot.amount = 0
				slot.item = null
	if remaining > 0:
		print("Not enough items.")
	update.emit()

