extends Area2D

@export var speed: float
@export var lifeTime: float
@export var damage: int = 1

var direction: Vector2 = Vector2.RIGHT

func _process(delta):
	position += direction * speed * delta
	lifeTime -= delta
	
	if lifeTime <= 0:
		queue_free()


func _on_body_entered(body):
	if "hit" in body:
		body.hit(position, damage)
	queue_free()
