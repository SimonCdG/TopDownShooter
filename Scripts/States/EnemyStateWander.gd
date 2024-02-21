extends State
class_name EnemyWander

@export var enemy:CharacterBody2D
@export var moveSpeed := 20.0
var player:CharacterBody2D

var moveDirection: Vector2
var wanderTime: float

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	randomize_wander()

func Update(_delta:float):
	wanderTime -= _delta
	var playerDistance = (player.position - enemy.position).length()
	
	if playerDistance < 100:
		transitioned.emit("EnemyChase")
	
	if wanderTime <= 0:
		Exit()
		transitioned.emit("EnemyIdle")

func Physics_Update(_delta:float):
	if enemy:
		enemy.velocity = moveDirection * moveSpeed

func randomize_wander():
	moveDirection = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	wanderTime = randf_range(1, 2)
