extends CharacterBody2D

@export var damages: int = 0

func _process(_delta):
	if velocity.x > 0:
		$Sprite2D.flip_h = false
	if velocity.x < 0:
		$Sprite2D.flip_h = true

func _physics_process(_delta):
	move_and_slide()
	
