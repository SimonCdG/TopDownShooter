extends PlayerState

func enter():
	player.velocity = Vector2.ZERO
	animation_player.play("Idle")
	set_process(true)

func exit(new_state):
	exit_state.emit(new_state)
	set_process(false)

func _process(delta):
	direction = Input.get_vector("left", "right", "up", "down")
	
	if direction != Vector2.ZERO:
		exit(Globals.MOVE)
