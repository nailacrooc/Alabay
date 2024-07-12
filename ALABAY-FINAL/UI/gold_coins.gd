extends Control

func _process(delta):
	$Label.text = str(Global.gold_coins)
