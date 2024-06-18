extends PlayerState

@onready var sprite: Sprite2D = owner.find_child("Sprite2D")

func enter():
	animation_player.play("Walk")
	set_process(true)
	set_physics_process(true)

func exit(new_state):
	exit_state.emit(new_state)
	set_process(false)
	set_physics_process(false)

func _process(delta):
	direction = Input.get_vector("left", "right", "up", "down")
	
	if direction == Vector2.ZERO:
		exit(Globals.IDLE)
	
	if player.velocity.x > 0:
		sprite.flip_h = false
	if player.velocity.x < 0:
		sprite.flip_h = true

func _physics_process(delta):
	pass
