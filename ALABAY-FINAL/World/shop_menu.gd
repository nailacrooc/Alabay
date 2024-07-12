extends Control

# Fruits
@onready var banana = $NinePatchRect/Fruits/banana
@onready var bayabas = $NinePatchRect/Fruits/bayabas
@onready var chico = $NinePatchRect/Fruits/chico
@onready var lemon = $NinePatchRect/Fruits/lemon
@onready var watermelon = $NinePatchRect/Fruits/watermelon

# Fruit Text
@onready var banana_txt = $NinePatchRect/Fruits/banana_txt
@onready var bayabas_txt = $NinePatchRect/Fruits/bayabas_txt
@onready var chico_txt = $NinePatchRect/Fruits/chico_txt
@onready var lemon_txt = $NinePatchRect/Fruits/lemon_txt
@onready var watermelon_txt = $NinePatchRect/Fruits/watermelon_txt

# Herbs
@onready var banaba = $NinePatchRect/Herbs/banaba
@onready var sambong = $NinePatchRect/Herbs/sambong
@onready var tawa_tawa = $NinePatchRect/Herbs/tawa_tawa
@onready var lagundi = $NinePatchRect/Herbs/lagundi

# Herbs Text
@onready var banaba_txt = $NinePatchRect/Herbs/banaba_txt
@onready var sambong_txt = $NinePatchRect/Herbs/sambong_txt
@onready var tawa_tawa_txt = $NinePatchRect/Herbs/tawa_tawa_txt
@onready var lagundi_txt = $NinePatchRect/Herbs/lagundi_txt

#Lists
@onready var Herbs = $NinePatchRect/Herbs
@onready var Fruits = $NinePatchRect/Fruits

@onready var price_txt = $NinePatchRect/price_txt
@onready var fruit_line = $NinePatchRect/fruit_line
@onready var herb_line = $NinePatchRect/herb_line
@onready var show_money = $shop_money/price_txt

#Fruits
@onready var banana_item = load("res://Assets/Items/Pickable items/Fruits/Banana.tres")
@onready var bayabas_item = load("res://Assets/Items/Pickable items/Fruits/Bayabas.tres")
@onready var chico_item = load("res://Assets/Items/Pickable items/Fruits/Chico.tres")
@onready var lemon_item = load("res://Assets/Items/Pickable items/Fruits/Lemon.tres")
@onready var watermelon_item = load("res://Assets/Items/Pickable items/Fruits/Watermelon.tres")

#Herbs
@onready var banaba_item = load("res://Assets/Items/Pickable items/Herbs/Banaba.tres")
@onready var sambong_item = load("res://Assets/Items/Pickable items/Herbs/Sambong.tres")
@onready var tawa_tawa_item = load("res://Assets/Items/Pickable items/Herbs/Tawa-Tawa.tres")
@onready var lagundi_item = load("res://Assets/Items/Pickable items/Herbs/Lagundi.tres")

@export var inv: Inv

var fruits = []
var fruits_txt = []
var herbs = []
var herbs_txt = []
var current_index = 0
var current_category = "fruits"

# Dictionary to store item prices
var item_prices = {
	"banana": 5,
	"bayabas": 10,
	"chico": 15,
	"lemon": 20,
	"watermelon": 25,
	"banaba": 5,
	"sambong": 10,
	"tawa_tawa": 15,
	"lagundi": 15
}

func _process(delta):
	show_money.text = str(Global.gold_coins)

func _ready():
	# Initialize the arrays with the correct node references
	fruits = [banana, bayabas, chico, lemon, watermelon]
	fruits_txt = [banana_txt, bayabas_txt, chico_txt, lemon_txt, watermelon_txt]
	herbs = [banaba, sambong, tawa_tawa, lagundi]
	herbs_txt = [banaba_txt, sambong_txt, tawa_tawa_txt, lagundi_txt]
	Herbs.visible = false
	herb_line.visible = false
	
	# Initially, show only the first item of the default category (fruits) and hide the rest
	_update_items_visibility()

func _on_right_btn_pressed():
	current_index = (current_index + 1) % get_current_items().size()
	_update_items_visibility()

func _on_left_btn_pressed():
	current_index = (current_index - 1 + get_current_items().size()) % get_current_items().size()
	_update_items_visibility()

func _update_items_visibility():
	var items = get_current_items()
	var items_txt = get_current_items_txt()
	
	for i in range(items.size()):
		items[i].visible = (i == current_index)
		items_txt[i].visible = (i == current_index)
	
	# Update price text to show the price of the current item
	var current_item_name = items[current_index].name.to_lower()
	if item_prices.has(current_item_name):
		price_txt.text = str(item_prices[current_item_name])
	else:
		price_txt.text = "Price: Not Available"

func get_current_items():
	if current_category == "fruits":
		return fruits
	else:
		return herbs

func get_current_items_txt():
	if current_category == "fruits":
		return fruits_txt
	else:
		return herbs_txt

func _on_buy_pressed():
	var current_item = get_current_items()[current_index]
	var current_item_name = current_item.name.to_lower()

	var item_to_buy = null
	if current_category == "fruits":
		match current_item_name:
			"banana":
				item_to_buy = banana_item
			"bayabas":
				item_to_buy = bayabas_item
			"chico":
				item_to_buy = chico_item
			"lemon":
				item_to_buy = lemon_item
			"watermelon":
				item_to_buy = watermelon_item
	elif current_category == "herbs":
		match current_item_name:
			"banaba":
				item_to_buy = banaba_item
			"sambong":
				item_to_buy = sambong_item
			"tawa_tawa":
				item_to_buy = tawa_tawa_item
			"lagundi":
				item_to_buy = lagundi_item

	if item_to_buy != null and item_prices.has(current_item_name):
		var price = item_prices[current_item_name]
		if Global.gold_coins >= price:
			inv.insert(item_to_buy)
			Global.gold_coins -= price
		else:
			print("Insufficient Money")
	else:
		print("Item not found in the price list or item is null")

func _on_fruit_btn_pressed():
	current_category = "fruits"
	fruit_line.visible = true
	herb_line.visible = false
	Herbs.visible = false
	Fruits.visible = true
	current_index = 0
	_update_items_visibility()

func _on_herb_btn_pressed():
	current_category = "herbs"
	fruit_line.visible = false
	herb_line.visible = true
	Herbs.visible = true
	Fruits.visible = false
	current_index = 0
	_update_items_visibility()
