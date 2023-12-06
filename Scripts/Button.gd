extends Area2D

var canPress = false
signal buttonPressed

func _on_body_entered(body):
	if body is Player:
		canPress = true

func _on_body_exited(body):
	if body is Player:
		canPress = false

func _process(delta):
	if Input.is_action_just_pressed("secondary_action") && canPress == true:
		buttonPressed.emit()
