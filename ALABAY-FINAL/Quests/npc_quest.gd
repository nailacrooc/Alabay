extends Control

signal quest_menu_closed
signal q1_active

var quest1_active = false
var quest2_active = false
var quest3_active = false
var quest4_active = false
var quest5_active = false

var quest1_done = false
var quest2_done = false
var quest3_done = false
var quest4_done = false
var quest5_done = false

var submitted_q1 = false
var submitted_q2 = false
var submitted_q3 = false
var submitted_q4 = false
var submitted_q5 = false

var gold_coins = Global.gold_coins

# Quests
@onready var quest1: NinePatchRect = $quest1
@onready var quest2: NinePatchRect = $quest2
@onready var no_quest: NinePatchRect = $no_quest
@onready var enter_npc_area: Node2D = $enter_npc_area
@onready var player: CharacterBody2D = get_node("/root/Environment/Player")
@onready var inv: Inv = preload("res://Player/Inventory/playerinv.tres")

@export var inventory: Inv
@export var item: InvItem

var in_npc_area = false

func _ready():
	enter_npc_area.visible = false
	
# Checks if the player completed the mission
func _process(delta):
	
	if quest1_active:
		# Handles the button visibility
		$quest1/submit_btn.visible = true
		$quest1/cancel_btn.visible = false
		$quest1/accept_btn.visible = false
		if submitted_q1:
			check_quest1()

	if quest2_active:
		$quest2/submit_btn_q2.visible = true
		$quest2/accept_btn_q2.visible = false
		$quest2/cancel_btn_q2.visible = false
		if submitted_q2:
			check_quest2()
	
	if quest3_active:
		$quest3/submit_btn_q3.visible = true
		$quest3/accept_btn_q3.visible = false
		$quest3/cancel_btn_q3.visible = false
		if submitted_q3:
			check_quest3()
	
	if quest4_active:
		$quest4/submit_btn_q4.visible = true
		$quest4/cancel_btn_q4.visible = false
		$quest4/accept_btn_q4.visible = false
		if submitted_q4:
			check_quest4()
	
	if quest5_active:
		$quest5/submit_btn_q5.visible = true
		$quest5/cancel_btn_q5.visible = false
		$quest5/accept_btn_q5.visible = false
		if submitted_q5:
			check_quest5()
			
	# If the player is near the NPC
	if in_npc_area:
		if Input.is_action_just_pressed("interact"):
			next_quest()
	else:
		turnoff_quest()

# If the player gets in the area, the questboard will appear
func _on_npc_area_body_entered(body):
	if body.name == "Player":
		in_npc_area = true
		enter_npc_area.visible = true

# If the player gets out the area, the questboard will disappear
func _on_npc_area_body_exited(body):
	if body.name == "Player":
		in_npc_area = false
		enter_npc_area.visible = false

func turnoff_quest():
	quest1.visible = false
	quest2.visible = false
	$quest3.visible = false
	$quest4.visible = false
	$quest5.visible = false
	
func next_quest():
	if !quest1_done:
		quest1.visible = true
	elif !quest2_done:
		quest1.visible = false
		quest2.visible = true
	elif !quest3_done:
		quest2.visible = false
		$quest3.visible = true
	elif !quest4_done:
		$quest3.visible = false
		$quest4.visible = true
	elif !quest5_done:
		$quest4.visible = false
		$quest5.visible = true
	else:
		no_quest.visible = true
		await get_tree().create_timer(3).timeout
		no_quest.visible = false

# Signals
# Quest 1
func _on_accept_btn_pressed():
	quest1.visible = false
	quest1_active = true
	emit_signal("q1_active")
	emit_signal("quest_menu_closed")

func _on_cancel_btn_pressed():
	quest1.visible = false
	quest1_active = false
	emit_signal("quest_menu_closed")
	
func _on_submit_btn_pressed():
	submitted_q1 = true

# Quest 2
func _on_accept_btn_q_2_pressed():
	quest2.visible = false
	quest2_active = true
	emit_signal("quest_menu_closed")

func _on_cancel_btn_q_2_pressed():
	quest2.visible = false
	quest2_active = false
	emit_signal("quest_menu_closed")

func _on_submit_btn_q_2_pressed():
	submitted_q2 = true

#Quest 3
func _on_accept_btn_q_3_pressed():
	$quest3.visible = false
	quest3_active = true
	emit_signal("quest_menu_closed")

func _on_cancel_btn_q_3_pressed():
	$quest3.visible = false
	quest3_active = false
	emit_signal("quest_menu_closed")

func _on_submit_btn_q_3_pressed():
	submitted_q3 = true

#Quest 4
func _on_accept_btn_q_4_pressed():
	$quest4.visible = false
	quest4_active = true
	emit_signal("quest_menu_closed")

func _on_cancel_btn_q_4_pressed():
	$quest4.visible = false
	quest4_active = false
	emit_signal("quest_menu_closed")

func _on_submit_btn_q_4_pressed():
	submitted_q4 = true

#Quest 5
func _on_accept_btn_q_5_pressed():
	$quest4.visible = false
	quest4_active = true
	emit_signal("quest_menu_closed")

func _on_cancel_btn_q_5_pressed():
	$quest5.visible = false
	quest5_active = false
	emit_signal("quest_menu_closed")

func _on_submit_btn_q_5_pressed():
	submitted_q5 = true

func check_quest5():
	var Sambong
	var Sambong_amount
	
	for slot in inv.slots:
		if slot.item != null:
			#print("Item: %s, Amount: %d" % [slot.item.name, slot.amount])
			if slot.item.name == "Sambong":
				Sambong = slot.item
				Sambong_amount = slot.amount
				if Sambong_amount >= 10:
					print("Quest2 Done")
					quest2_active = false
					quest2_done = true
					quest2.visible = false
					gold_coins += 10
					inv.remove_items(Sambong, 10)
					inv.update.emit()

func check_quest4():
	var Papaya
	var Papaya_amount
	
	for slot in inv.slots:
		if slot.item != null:
			#print("Item: %s, Amount: %d" % [slot.item.name, slot.amount])
			if slot.item.name == "Papaya":
				Papaya = slot.item
				Papaya_amount = slot.amount
				if Papaya_amount >= 8:
					print("Quest2 Done")
					quest2_active = false
					quest2_done = true
					quest2.visible = false
					gold_coins += 10
					inv.remove_items(Papaya, 8)
					inv.update.emit()

func check_quest3():
	var Lagundi
	var Lagundi_amount
	
	for slot in inv.slots:
		if slot.item != null:
			#print("Item: %s, Amount: %d" % [slot.item.name, slot.amount])
			if slot.item.name == "Lagundi":
				Lagundi = slot.item
				Lagundi_amount = slot.amount
				if Lagundi_amount >= 10:
					print("Quest3 Done")
					quest2_active = false
					quest2_done = true
					quest2.visible = false
					gold_coins += 10
					inv.remove_items(Lagundi, 10)
					inv.update.emit()

func check_quest2():
	var Bayabas
	var Bayabas_amount
	
	for slot in inv.slots:
		if slot.item != null:
			#print("Item: %s, Amount: %d" % [slot.item.name, slot.amount])
			if slot.item.name == "Bayabas":
				Bayabas = slot.item
				Bayabas_amount = slot.amount
				if Bayabas_amount >= 7:
					print("Quest2 Done")
					quest2_active = false
					quest2_done = true
					quest2.visible = false
					gold_coins += 10
					inv.remove_items(Bayabas, 7)
					inv.update.emit()

func check_quest1():
	var Chico
	var Chico_amount
	
	for slot in inv.slots:
		if slot.item != null:
			#print("Item: %s, Amount: %d" % [slot.item.name, slot.amount])
			if slot.item.name == "Chico":
				Chico = slot.item
				Chico_amount = slot.amount
				if Chico_amount >= 5:
					print("Quest1 Done")
					quest1_active = false
					quest1_done = true
					quest1.visible = false
					gold_coins += 10
					inv.remove_items(Chico, 5)
					inv.update.emit()

