extends Node2D

var rambutan = preload("res://Assets/Items/Pickable items/Fruits/pickable_rambutan.tscn")

func _on_timer_timeout():
	var spawn_rambutan = rambutan.instantiate()
	var area = $spawn_area
	var position = area.position + Vector2(randf() * area.size.x, randf() * area.size.y)
	
	add_child(spawn_rambutan)
	spawn_rambutan.position = $rambutan_spawn.position
	$rambutan_spawn.position = position
