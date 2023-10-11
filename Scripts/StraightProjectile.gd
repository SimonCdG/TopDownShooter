extends Hitbox

@export var speed: float
@export var lifeTime: float
@export var damages: int = 1

var direction: Vector2 = Vector2.RIGHT

func _process(delta):
	position += direction * speed * delta
	lifeTime -= delta
	
	if lifeTime <= 0:
		queue_free()

func _on_body_entered(body):
	if "hit" in body:
		damages_calculation(body, damages)
	queue_free()
