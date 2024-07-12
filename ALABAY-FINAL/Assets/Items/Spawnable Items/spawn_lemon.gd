extends Node2D

var lemon = preload("res://Assets/Items/Pickable items/Fruits/pickable_lemon.tscn")

func _on_timer_timeout():
	var spawn_lemon = lemon.instantiate()
	var area = $spawn_area
	var position = area.position + Vector2(randf() * area.size.x, randf() * area.size.y)
	
	add_child(spawn_lemon)
	spawn_lemon.position = $lemon_spawn.position
	$lemon_spawn.position = position
