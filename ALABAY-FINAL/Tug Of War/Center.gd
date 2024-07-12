extends Area2D

var maxSpeed = 1000.0  # Adjust this value to change the maximum speed of the tug of war movement
var acceleration = 15.0  # Adjust this value to change the acceleration rate
var constantRightForce = 10.0  # Adjust this value to change the constant force pushing the object to the right

var velocity = Vector2.ZERO

var winAreaPosition = Vector2(-67.0, 0.0)  # Adjust this position based on where you want the win area to be
var prompt: Label

var loseAreaPosition = Vector2(78.0, 0.0)  # Adjust this position based on where you want the lose area to be
var won = false
var spacePressed = false  # Flag to track if space key was pressed
@onready var gold_coin: Sprite2D = $"../gold_coin"
@onready var coin_amount: Label = $"../coin_amount"

func _ready():
	
	gold_coin.visible = false
	coin_amount.visible = false
	$"../Button".visible = false
	prompt = get_node("../UIPrompt")  # Adjust this path to the actual path of your UIPrompt node
	if prompt != null:
		prompt.hide()
	else:
		print("UIPrompt not found")

func _process(delta):
	if position.x <= winAreaPosition.x:
		# Stop movement
		velocity = Vector2.ZERO
		constantRightForce = 0.0
		# Show the "You Win!" UI prompt
		prompt.text = "You Win!"
		gold_coin.visible = true
		coin_amount.visible = true
		$"../Button".visible = true
		won = true
		prompt.show()
		
	if position.x >= loseAreaPosition.x:
		# Stop movement
		velocity = Vector2.ZERO
		constantRightForce = 0.0
		# Show the "You Lose!" UI prompt
		prompt.text = "You Lose!"
		$"../Button".visible = true
		prompt.show()
		
	# Apply a constant force to the right
	velocity.x += constantRightForce * delta

	# Check if space is pressed and released
	if Input.is_action_just_pressed("space") and not spacePressed:
		# Increase velocity to the left when space is pressed
		# Change integer to change how much increase in acceleration
		velocity.x -= acceleration * 4
		spacePressed = true  # Set the flag to true when space is pressed

	if Input.is_action_just_released("space"):
		spacePressed = false  # Reset the flag when space is released

	# Slow down velocity when space is not pressed
	velocity.x = lerp(velocity.x, constantRightForce, 0.1)  # Smoothly decrease velocity to the constant right force

	# Limit velocity to the maximum speed
	velocity.x = clamp(velocity.x, -maxSpeed, maxSpeed)

	# Move the tug of war object
	position += velocity * delta


func _on_button_pressed():
	if won:
		Global.gold_coins += 20
	get_tree().change_scene_to_file("res://World/Environment.tscn")
