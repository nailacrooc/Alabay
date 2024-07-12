extends Node2D

var chico = preload("res://Assets/Items/Pickable items/Fruits/pickable_chico.tscn")

func _on_timer_timeout():
	var spawn_chico = chico.instantiate()
	var area = $spawn_area
	var position = area.position + Vector2(randf() * area.size.x, randf() * area.size.y)
	
	add_child(spawn_chico)
	spawn_chico.position = $chico_spawn.position
	$chico_spawn.position = position
