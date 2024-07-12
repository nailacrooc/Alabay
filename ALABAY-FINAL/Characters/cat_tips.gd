extends Control
# Declare an array to hold the five nodes
var nodes = []

func _ready():
	# Add the child nodes to the array
	nodes.append($tip1)
	nodes.append($tip2)
	nodes.append($tip3)
	nodes.append($tip4)
	nodes.append($tip5)

func randomize_visibility():
	# Hide all nodes
	for node in nodes:
		node.hide()
	
	# Randomly select one node to be visible
	var random_index = randi() % nodes.size()
	nodes[random_index].show()


func _on_cats_open_tip():
	randomize_visibility()
