extends Hitbox

@onready var enemy = $".."

func _on_body_entered(body):
	damages_calculation(body, enemy.damages)
