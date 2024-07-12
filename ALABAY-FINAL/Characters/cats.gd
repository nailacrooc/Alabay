extends CharacterBody2D

signal open_tip

var in_npc_area = false
@onready var enter_npc_area = $enter_npc_area

func _ready():
	enter_npc_area.visible = false

func _process(delta):
	$AnimatedSprite2D.play("idle")
	if in_npc_area:
		if Input.is_action_just_pressed("interact"):
			emit_signal("open_tip")
			$cat_tips.visible = true
	else:
		turnoff_tips()

func turnon_tips():
	$cat_tips.visible = true

func turnoff_tips():
	$cat_tips.visible = false

func _on_npc_area_body_entered(body):
	if body.name == "Player":
		in_npc_area = true
		enter_npc_area.visible = true

func _on_npc_area_body_exited(body):
	if body.name == "Player":
		in_npc_area = false
		enter_npc_area.visible = false
