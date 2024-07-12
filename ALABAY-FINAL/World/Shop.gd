extends Area2D

var in_shop_area: bool
var shop_opened = false
@onready var enter_shop_area: Node2D = $enter_shop_area

func _ready():
	$"UI Canvas/shop_menu".visible = false

func _process(delta):
	open_shop()

func _on_body_entered(body):
	if body.name == "Player":
		in_shop_area = true

func _on_body_exited(body):
	if body.name == "Player":
		in_shop_area = false

#Handles visibility of inventory and shop menu
func open_shop():
	if in_shop_area:
		enter_shop_area.visible = true
		if Input.is_action_just_pressed("interact") and !shop_opened:
			shop_opened = true
			$"UI Canvas/shop_menu".visible = true
			$"../UI Canvas/Inv_UI_small".visible = false
			$"../UI Canvas/Inv_UI".visible = false
		elif Input.is_action_just_pressed("interact") and shop_opened:
			shop_opened = false
			$"UI Canvas/shop_menu".visible = false
			$"../UI Canvas/Inv_UI_small".visible = true
			$"../UI Canvas/Inv_UI".visible = false
	else:
		enter_shop_area.visible = false
		$"UI Canvas/shop_menu".visible = false
	
	#Handles inv_ui_small visibility
	if !in_shop_area and $"../UI Canvas/Inv_UI".visible == false:
		$"../UI Canvas/Inv_UI_small".visible = true
