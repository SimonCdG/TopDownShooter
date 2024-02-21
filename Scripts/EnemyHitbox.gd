extends Hitbox

@onready var enemy = $".."

func _on_body_entered(body):
	if body is Player:
		damages_calculation(body, enemy.damages)
