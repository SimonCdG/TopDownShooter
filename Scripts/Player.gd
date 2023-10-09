class_name Player
extends CharacterBody2D

@export var maxSpeed: float = 150 

var direction: Vector2

signal boltFired(position, Vector2)

var canFireBolt: bool = true
@onready var sprite: Sprite2D = $Sprite2D
@onready var fireBoltTimer: Timer = $FireBolt
@onready var animationPlayer: AnimationPlayer = $AnimationPlayer


func _process(_delta):
	
	direction = Input.get_vector("left", "right", "up", "down")
	
	#Animate the Player
	if direction.abs() != Vector2.ZERO:
		animationPlayer.play("Walk")
	else:
		animationPlayer.play("Idle")
	
	if velocity.x > 0:
		sprite.flip_h = false
	if velocity.x < 0:
		sprite.flip_h = true
	
	
	#Fire a bolt
	if Input.is_action_just_pressed("secondary_action") && canFireBolt:
		var mouseDirection = (get_global_mouse_position() - position).normalized()
		boltFired.emit(position, mouseDirection)
		canFireBolt = false
		fireBoltTimer.start()

func _physics_process(_delta):
	
	velocity = direction * maxSpeed
	move_and_slide()


func _on_fire_bolt_timeout():
	canFireBolt = true
