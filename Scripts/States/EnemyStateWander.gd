extends State
class_name EnemyWander

@export var moveSpeed := 20.0

var moveDirection: Vector2
var wanderTime: float

func Enter():
	randomize_wander()

func Update(_delta:float):
	wanderTime -= _delta
	
	if wanderTime <= 0:
		Exit()
		transitioned.emit()

func Physics_Update(_delta:float):
	if enemy:
		enemy.velocity = moveDirection * moveSpeed

func randomize_wander():
	moveDirection = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	wanderTime = randf_range(1, 2)
