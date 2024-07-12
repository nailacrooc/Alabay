extends Area2D

var entered = false
@onready var enter_door: Node2D = $enter_door

func _on_body_entered(body):
	if body.name == "Player":
		entered = true

func _on_body_exited(body):
	if body.name == "Player":
		entered = false

func _process(delta):
	if entered == true:
		enter_door.visible = true
		
		if Input.is_action_just_pressed("interact"):
			var currentScene = get_tree().current_scene.name
			#Checks what current scene the player are
			if currentScene == "Environment":
				get_tree().change_scene_to_file("res://World/house_inside.tscn")
			elif currentScene == "house_inside":
				get_tree().change_scene_to_file("res://World/Environment.tscn")
	else:
		enter_door.visible = false
