extends CharacterBody2D

@export var maxSpeed: float = 50 

var direction: Vector2 = Vector2.RIGHT

func _physics_process(_delta):
	
	velocity = direction * maxSpeed
	move_and_slide()
