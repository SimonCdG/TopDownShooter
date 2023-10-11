class_name Player
extends CharacterBody2D

@export var maxSpeed: float = 150 

var direction: Vector2

signal boltFired(position, Vector2)
var canSwingAxe: bool = true
var canFireBolt: bool = true
@onready var sprite: Sprite2D = $WarriorSprite
@onready var axe: Area2D = $Axe
@onready var axePivot: Marker2D = $Axe/AxePivot
@onready var axeSprite: Sprite2D = $Axe/AxePivot/AxeSprite
@onready var axeSwingTimer: Timer = $AxeSwing
@onready var axeAnimation: AnimationPlayer = $Axe/WeaponAnimation
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
	
	#Animate the axe
	
	var mouse_position = get_global_mouse_position()
	
	axe.look_at(mouse_position)
	if mouse_position.x - global_position.x > 0 :
		axePivot.scale.y = 1
	else:
		axePivot.scale.y = -1
	
	#Swing the axe
	if Input.is_action_just_pressed("primary_action") && canSwingAxe:
		axeAnimation.play("MeleeSwing")
		canSwingAxe = false
		axeSwingTimer.start()
	
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


func _on_axe_swing_timeout():
	canSwingAxe = true
