extends CharacterBody2D

@export var MAX_HEALTH = 10
@export var MAX_SPEED = 10
@export var damages: int = 0
@onready var state_machine = $StateMachine

func _process(_delta):
	if velocity.x > 0:
		$Sprite2D.flip_h = false
	if velocity.x < 0:
		$Sprite2D.flip_h = true

func _physics_process(_delta):
	move_and_slide()
	

func hit(_global_position, _damagesDealt):
	state_machine.on_child_transition("EnemyHurt")
