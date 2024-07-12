extends PointLight2D

func _on_daynight_cycle_day_time():
	$AnimationPlayer.play("off_light")

func _on_daynight_cycle_night_time():
	$AnimationPlayer.play("on_light")
