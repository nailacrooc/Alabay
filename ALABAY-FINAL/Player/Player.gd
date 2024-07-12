extends CharacterBody2D

class_name my_player

var speed = 180
var motion = Vector2.ZERO

# Inventory
@export var inv: Inv
@export var inv_ui: inv_ui

# Movements
var moving_right = true
var moving_left = false
var moving_up = true
var moving_down = false
var move_upright = false
var move_upleft = false
var move_downright = false
var move_downleft = false
var idle = true
var is_walking_sound_playing = false

func _physics_process(_delta):
	idle = true
	motion = Vector2.ZERO
	
	if Input.is_action_pressed("move_right"):
		motion.x += 1
		moving_right = true
		moving_up = false
		moving_down = false
		idle = false
	elif Input.is_action_pressed("move_left"):
		motion.x -= 1
		moving_right = false
		moving_up = false
		moving_down = false
		moving_left = true
		idle = false
	
	if Input.is_action_pressed("move_down"):
		motion.y += 1
		moving_up = false
		moving_right = false
		moving_down = true
		idle = false
			
	elif Input.is_action_pressed("move_up"):
		motion.y -= 1
		moving_up = true
		moving_right = false
		moving_down = false
		idle = false
	

	if motion.length() > 0:
		motion = motion.normalized() * speed
		if motion.x > 0 and moving_right:
			$AnimatedSprite2D.play("walk_right")
		elif motion.x < 0 and not moving_right and not moving_down and not moving_up:
			$AnimatedSprite2D.play("walk_left")
		if motion.y > 0:
			$AnimatedSprite2D.play("walk_down")
		elif motion.y < 0:
			$AnimatedSprite2D.play("walk_up")
		
		if not is_walking_sound_playing:
			$walking_sfx.play()
			is_walking_sound_playing = true
	# Idle Animation
	else:
		if is_walking_sound_playing:
			$walking_sfx.stop()
			is_walking_sound_playing = false

		
		if idle and moving_right:
			$AnimatedSprite2D.play("idle_right")
		if idle and not moving_right:
			$AnimatedSprite2D.play("idle_left")
		if idle and moving_up:
			$AnimatedSprite2D.play("idle_up")
		if idle and moving_down:
			$AnimatedSprite2D.play("idle_down")
	set_velocity(motion)
	move_and_slide()

func submit_quest(item, required_amount):
	if inv.get_item_count(item) >= required_amount:
		if inv.remove_items(item, required_amount):
			return true
	return false

func collect(item):
	inv.insert(item)
	print(item.name)

