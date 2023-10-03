class_name Player
extends CharacterBody2D

@export var maxSpeed: float = 150 

var direction: Vector2


func _process(_delta):
	
	direction = Input.get_vector("left", "right", "up", "down")


func _physics_process(_delta):
	
	velocity = direction * maxSpeed
	move_and_slide()
