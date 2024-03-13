extends State
class_name  EnemyChase

var player:CharacterBody2D

var moveDirection : Vector2

func Enter():
	if !hasEntered:
		player = get_tree().get_first_node_in_group("Player")
		hasEntered = true

func Exit():
	enemy.velocity = Vector2.ZERO

func Update(_delta:float):
	var enemyPosition = enemy.position
	moveDirection = enemyPosition.direction_to(player.position)
	var playerDistance = enemy.position.distance_to(player.position)
	if playerDistance > 200:
		transitioned.emit()

func Physics_Update(_delta:float):
	if enemy:
		enemy.velocity = moveDirection * enemy.max_speed
