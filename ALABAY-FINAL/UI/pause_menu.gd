extends Control

signal back_btn_pressed

func _ready():
	$options_menu.visible = false

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://UI/MainMenu.tscn")
	GlobalAudioStreamPlayer.current_scene = "MainMenu"

func _on_back_pressed():
	emit_signal("back_btn_pressed")
	$".".visible = false
	$"../Button".visible = true
	
func _on_options_pressed():
	$pause_menu_handler.visible = false
	$options_menu.visible = true
