extends Control

func _ready():
	$pause_menu.visible = false

func _on_button_pressed():
	$Button.visible = false
	$pause_menu.visible = true
	$"../Inv_UI_small".visible = false
	$"../Inv_UI".visible = false

func _on_pause_menu_back_btn_pressed():
	$"../Inv_UI_small".visible = true
