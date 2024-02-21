extends State
class_name EnemyIdle

var idleTime: float
@export var enemy:CharacterBody2D
var player:CharacterBody2D

func Enter():
	enemy.velocity = Vector2.ZERO
	randomize_idle()
	player = get_tree().get_first_node_in_group("Player")

func Exit():
	enemy.velocity = Vector2.ZERO

func randomize_idle():
	idleTime = randf_range(2, 3)

func Update(_delta:float):
	idleTime -= _delta
	var playerDistance = (player.position - enemy.position).length()
	
	if playerDistance < 100:
		transitioned.emit("EnemyChase")
	
	if idleTime <= 0:
		transitioned.emit("EnemyWander")
