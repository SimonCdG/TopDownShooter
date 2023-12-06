extends Area2D

var canPress = false
signal buttonPressed

func _on_body_entered(body):
	if body is Player:
		canPress = true
		print(canPress)

func _on_body_exited(body):
	if body is Player:
		canPress = false
		print(canPress)

func _process(_delta):
	if Input.is_action_just_pressed("secondary_action") && canPress == true:
		print("buttonPressed")
		buttonPressed.emit()
