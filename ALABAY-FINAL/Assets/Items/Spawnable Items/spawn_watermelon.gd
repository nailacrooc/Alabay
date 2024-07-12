extends Node2D

var watermelon = preload("res://Assets/Items/Pickable items/Fruits/pickable_watermelon.tscn")

func _on_timer_timeout():
	var spawn_watermelon = watermelon.instantiate()
	var area = $spawn_area
	var position = area.position + Vector2(randf() * area.size.x, randf() * area.size.y)
	
	add_child(spawn_watermelon)
	spawn_watermelon.position = $watermelon_spawn.position
	$watermelon_spawn.position = position
