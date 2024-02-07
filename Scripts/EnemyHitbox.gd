extends Hitbox

@onready var enemy = $".."

func _on_body_entered(body):
	if body is Player:
		print("hit")
		damages_calculation(body, enemy.damages)
