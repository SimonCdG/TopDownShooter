extends State
class_name EnemyIdle

var idleTime: float

func Enter():
	enemy.velocity = Vector2.ZERO
	randomize_idle()

func Exit():
	enemy.velocity = Vector2.ZERO

func randomize_idle():
	idleTime = randf_range(2, 4)

func Update(_delta:float):
	idleTime -= _delta
	if idleTime < 0:
		Exit()
		transitioned.emit()
