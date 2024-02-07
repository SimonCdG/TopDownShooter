extends State
class_name  EnemyChase

@export var enemy:CharacterBody2D
@export var moveSpeed := 50.0
var player:CharacterBody2D

var moveDirection: Vector2

func Enter():
	player = get_tree().get_first_node_in_group("Player")

func Update(_delta:float):
	var playerDistance = (player.position - enemy.position).length()
	moveDirection = (player.position - enemy.position).normalized()
	
	if playerDistance > 200:
		transitioned.emit("EnemyIdle")

func Physics_Update(_delta:float):
	if enemy:
		enemy.velocity = moveDirection * moveSpeed
