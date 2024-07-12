extends Node2D

var banana = preload("res://Assets/Items/Pickable items/Fruits/pickable_banana.tscn")

func _on_timer_timeout():
	var spawn_banana = banana.instantiate()
	var area = $spawn_area
	var position = area.position + Vector2(randf() * area.size.x, randf() * area.size.y)
	
	add_child(spawn_banana)
	spawn_banana.position = $banana_spawn.position
	$banana_spawn.position = position
