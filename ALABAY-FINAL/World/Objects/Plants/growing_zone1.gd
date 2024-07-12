extends StaticBody2D

var plant = Global.selected_plant
var plant_growing = false
var plant_grown = false
var plant_watered = false
var item_num = Global.selected_item

func _process(delta):
	if not plant_growing:
		plant = Global.selected_plant

func _on_area_2d_area_entered(area):
	if area.name != "watering_can": #If the item is not watering can (change to if item is plant)
		if not plant_growing:
			start_plant_growth()
		else: #If there is already a plant already growing
			print("There is a plant currently growing")
	elif area.name == "watering_can": #If the item is watering can
		if plant_growing and not plant_watered:
			if item_num == 1:
				plant_watered = true
				print("Plant has been watered")

#Start the timer for the growth of plant
func start_plant_growth():
	plant_growing = true
	if plant == 1:  # If plant is potato
		$potato_timer.start()
		$Plant.play("growing_potato")
	elif plant == 2:  # If plant is tomato
		$tomato_timer.start()
		$Plant.play("growing_tomato")

#Checks the current frame of the plant then grows it
func _on_potato_timer_timeout():
	var potato_plant = $Plant
	if potato_plant.frame == 0  and plant_watered: #If plant is not watered it will not grow
		potato_plant.frame = 1
		$potato_timer.start()
	elif potato_plant.frame == 1:
		potato_plant.frame = 2
		$potato_timer.start()
	elif potato_plant.frame == 2:
		potato_plant.frame = 3
		$potato_timer.start()
	elif potato_plant.frame == 3:
		potato_plant.frame = 4
		plant_grown = true

func _on_tomato_timer_timeout():
	var tomato_plant = $Plant
	if tomato_plant.frame == 0 and plant_watered: #If plant is not watered it will not grow
		tomato_plant.frame = 1
		$tomato_timer.start()
	elif tomato_plant.frame == 1:
		tomato_plant.frame = 2
		$tomato_timer.start()
	elif tomato_plant.frame == 2:
		tomato_plant.frame = 3
		$tomato_timer.start()
	elif tomato_plant.frame == 3:
		tomato_plant.frame = 4
		plant_grown = true

#Harvests the plant
func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("left_click"):
		if plant_grown:
			if plant == 1: #If plant is potato
				Global.num_potato += 1
				plant_growing = false
				plant_grown = false
				plant_watered = false
				$Plant.play("null")
			if plant == 2: #If plant is tomato
				Global.num_tomato += 1
				plant_growing = false
				plant_grown = false
				plant_watered = false
				$Plant.play("null")
			else:
				pass
		print("Potatoes: " + str(Global.num_potato))
		print("Tomatoes: " + str(Global.num_tomato))
