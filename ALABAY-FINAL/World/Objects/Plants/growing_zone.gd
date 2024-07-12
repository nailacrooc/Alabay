extends StaticBody2D

var plant_grown = false
var day_time = false

#plants
var banaba = preload("res://Assets/Items/Pickable items/Herbs/pickable_banaba.tscn")
var sambong = preload("res://Assets/Items/Pickable items/Herbs/pickable_sambong.tscn")
var tawa_tawa = preload("res://Assets/Items/Pickable items/Herbs/pickable_tawa-tawa.tscn")
var lagundi = preload("res://Assets/Items/Pickable items/Herbs/pickable_lagundi.tscn")

var plant_drops = [banaba, sambong, tawa_tawa, lagundi]
var plant_list = ["banaba", "sambong", "tawa_tawa", "lagundi"]
var random_index = randi() % plant_list.size()  # Generate a random index
var plant = plant_list[random_index]  # Select a random plant from the list

func _process(delta):
	if day_time:
		$Timer.start()

func _ready():
	check_plant()

func check_plant():
	if plant == "banaba":
		$Timer.start()
		$Plant.play("plant1")
	elif plant == "sambong":
		$Timer.start()
		$Plant.play("plant2")
	elif plant == "tawa_tawa":
		$Timer.start()
		$Plant.play("plant3")
	elif plant == "lagundi":
		$Timer.start()
		$Plant.play("plant4")

#Checks what herbs to drop depending on the plant
func check_drop():
	if plant == "banaba":
		var spawn_banaba = banaba.instantiate()
		add_child(spawn_banaba)
	elif plant == "sambong":
		var spawn_sambong = sambong.instantiate()
		add_child(spawn_sambong)
	elif plant == "tawa_tawa":
		var spawn_tawa_tawa = tawa_tawa.instantiate()
		add_child(spawn_tawa_tawa)	
	elif plant == "lagundi":
		var spawn_lagundi = lagundi.instantiate()
		add_child(spawn_lagundi)	

func start_growth():
	var plant_anim = $Plant
	if plant_anim.frame == 0: #If plant is not watered it will not grow
		plant_anim.frame = 1
		$Timer.start()
	elif plant_anim.frame == 1:
		plant_anim.frame = 2
		$Timer.start()
	elif plant_anim.frame == 2:
		plant_anim.frame = 3
		$Timer.start()
	elif plant_anim.frame == 3:
		plant_anim.frame = 4
		plant_grown = true

func _on_timer_timeout():
	start_growth()

#Harvests the plant
func _on_area_2d_body_entered(body):
	if body.name == "Player":
		if plant_grown:
			$Plant.play("null")
			plant_grown = false
			check_drop()
			print("harvested")
