extends Control

func _ready():
	$menu_music.play()
	$CreditsMenu.visible = false
# Called when the node enters the scene tree for the first time.
func _on_play_pressed():
	if Global.par6_done:
		get_tree().change_scene_to_file("res://World/house_inside.tscn")
	else:
		get_tree().change_scene_to_file("res://UI/beginning_story.tscn")

func _on_credits_pressed():
	$MainMenu.visible = false
	$CreditsMenu.visible = true
	
func _on_exit_pressed():
	get_tree().quit()

func _on_back_pressed():
	$CreditsMenu.visible = false
	$MainMenu.visible = true
