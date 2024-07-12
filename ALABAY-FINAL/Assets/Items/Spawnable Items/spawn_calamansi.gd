extends Node2D

var calamansi = preload("res://Assets/Items/Pickable items/Fruits/pickable_calamansi.tscn")

func _on_timer_timeout():
	var spawn_calamansi = calamansi.instantiate()
	var area = $spawn_area
	var position = area.position + Vector2(randf() * area.size.x, randf() * area.size.y)
	
	add_child(spawn_calamansi)
	spawn_calamansi.position = $calamansi_spawn.position
	$calamansi_spawn.position = position
