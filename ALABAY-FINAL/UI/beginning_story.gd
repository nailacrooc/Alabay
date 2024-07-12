extends Control

var p1_done = false
var p2_done = false
var p3_done = false
var p4_done = false
var p5_done = false
var p6_done = false

@onready var p1 = $paragraph1
@onready var p2 = $paragraph2
@onready var p3 = $paragraph3
@onready var p4 = $paragraph4
@onready var p5 = $paragraph5
@onready var p6 = $paragraph6

func _ready():
	p1.visible = true
	p2.visible = false
	p3.visible = false
	p4.visible = false
	p5.visible = false
	p6.visible = false
	$anim.play("p1_in")

func _on_button_pressed():
	if !p1_done:
		$anim.play("p1_out")
		p1.visible = false
		p2.visible = true
		$anim.play("p2_in")
		p1_done = true
	elif !p2_done:
		$anim.play("p2_out")
		p2.visible = false
		p3.visible = true
		$anim.play("p3_in")
		p2_done = true
	elif !p3_done:
		$anim.play("p3_out")
		p3.visible = false
		p4.visible = true
		$anim.play("p4_in")
		p3_done = true
	elif !p4_done:
		$anim.play("p4_out")
		p4.visible = false
		p5.visible = true
		$anim.play("p5_in")
		p4_done = true
	elif !p5_done:
		$anim.play("p5_out")
		p5.visible = false
		p6.visible = true
		$anim.play("p6_in")
		p5_done = true
	elif !p6_done:
		$anim.play("p6_out")
		p6.visible = false
		p6_done = true
		Global.par6_done = true
	
	if p6_done:
		get_tree().change_scene_to_file("res://World/house_inside.tscn")
