extends StaticBody2D

var selected = false
var item_num = 1

func _ready():
	$AnimatedSprite2D.play("watering_can")

#Check if mouse clicks the seed
func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("left_click"):
		Global.selected_item = item_num
		selected = true

#Moves the watering_can along the mouse
func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 100 * delta)

#Check if mouse is not clicking anymore on the watering_can
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			selected = false
