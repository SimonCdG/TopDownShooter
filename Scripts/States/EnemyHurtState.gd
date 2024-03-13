extends State
class_name EnemyHurt
var player:CharacterBody2D

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	print("hurt")
