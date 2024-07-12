extends Node2D

var monsters = preload("res://Characters/monster.tscn")
var night_time: bool = false
var spawned = false

func _on_timer_timeout():
	if night_time and not spawned:
		var spawn_monster = monsters.instantiate()
		var area = $spawn_area
		var position = area.position + Vector2(randf() * area.size.x, randf() * area.size.y)
	
		add_child(spawn_monster)
		spawn_monster.position = position
	
		var animation_player = spawn_monster.get_node("AnimationPlayer")
		animation_player.play("spawn")
		spawned = true

func _on_night_timer_timeout():
	night_time = true
	print("night time")

func _on_day_timer_timeout():
	night_time = false
	spawned = false
