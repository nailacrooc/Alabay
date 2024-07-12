extends Control

func _on_back_pressed():
	$".".visible = false #options_menu node
	$"../pause_menu_handler".visible = true #pause_menu node

func _on_check_button_pressed():
	GlobalAudioStreamPlayer.toggle_music_mute()
