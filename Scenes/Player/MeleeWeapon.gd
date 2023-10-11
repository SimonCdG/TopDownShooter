extends Hitbox

@export var damages: int = 1

func _on_body_entered(body):
	if "hit" in body:
		damages_calculation(body, damages)
