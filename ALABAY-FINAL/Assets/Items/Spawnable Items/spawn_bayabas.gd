extends Node2D

var bayabas = preload("res://Assets/Items/Pickable items/Fruits/pickable_bayabas.tscn")

func _on_timer_timeout():
	var spawn_bayabas = bayabas.instantiate()
	var area = $spawn_area
	var position = area.position + Vector2(randf() * area.size.x, randf() * area.size.y)
	
	add_child(spawn_bayabas)
	spawn_bayabas.position = $bayabas_spawn.position
	$bayabas_spawn.position = position
	
