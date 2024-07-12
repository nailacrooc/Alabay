extends Control

var opened = false
var closed = true

func _ready():
	$".".visible = false

func _on_next_button_pressed():
	$RecipeBook2.visible = true
	$RecipeBook1.visible = false

func _on_back_button_pressed():
	$RecipeBook2.visible = false
	$RecipeBook1.visible = true

func _process(delta):
	if Input.is_action_just_pressed("open_recipe_book"):
		if opened:
			close_book()
		else:
			open_book()

func open_book():
	if closed:
		opened = true
		closed = false
		$".".visible = true

func close_book():
	if opened:
		opened = false
		closed = true
		$".".visible = false
