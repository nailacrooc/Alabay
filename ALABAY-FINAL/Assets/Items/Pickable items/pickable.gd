extends Area2D

var player_in_area = false
var player = null
@export var item: InvItem

#If player collided with the object
func _on_body_entered(body):
	if body.name == "Player":
		player_in_area = true
		player = body
		#Plays "+1" animation 
		$AnimationPlayer.play("pick_up")
		$pick_up.play()
		$Sprite2D.visible = false
		
		#Puts the collected item to inv
		playercollect()
		await get_tree().create_timer(0.3).timeout #delays the disappearing of the apple
		queue_free()

func playercollect():
	player.collect(item)
