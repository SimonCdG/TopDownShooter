class_name Player
extends CharacterBody2D

var direction: Vector2
var canSwingAxe: bool = true
var canFireBolt: bool = true
var canMove: bool = true

@export var maxSpeed: float = 150
@export var maxHealth: int = 15
@export var knockback: int = 20

@onready var sprite: Sprite2D = $Sprite2D
@onready var axe: Area2D = $Axe
@onready var axePivot: Marker2D = $Axe/AxePivot
@onready var axeSprite: Sprite2D = $Axe/AxePivot/AxeSprite
@onready var axeSwingTimer: Timer = $AxeSwing
@onready var axeAnimation: AnimationPlayer = $Axe/WeaponAnimation
@onready var fireBoltTimer: Timer = $FireBolt
@onready var controlTimer: Timer = $ControlTimer
@onready var animationPlayer: AnimationPlayer = $AnimationPlayer

signal boltFired(position, Vector2)
signal healthUpdated()

func _init():
	Globals.playerMaxHealth = maxHealth

func _ready():
	set_process(false)
	set_physics_process(false)

func _process(delta):
	
	if canMove:
		direction = Input.get_vector("left", "right", "up", "down")
	else:
		direction = lerp(direction, Input.get_vector("left", "right", "up", "down")/5, 10 * delta)
	
	#Animate the Player
	if velocity.abs() != Vector2.ZERO && canMove:
		animationPlayer.play("Walk")
	else:
		animationPlayer.play("Idle")
	
	if velocity.x > 0 && canMove:
		sprite.flip_h = false
	if velocity.x < 0 && canMove:
		sprite.flip_h = true
	
	#Animate the axe
	
	var mouse_position = get_global_mouse_position()
	
	axe.look_at(mouse_position)
	if mouse_position.x - global_position.x > 0 :
		axePivot.scale.y = 1
	else:
		axePivot.scale.y = -1
	
	#Swing the axe
	if Input.is_action_pressed("primary_action") && canSwingAxe:
		axeAnimation.play("MeleeSwing")
		canSwingAxe = false
		axeSwingTimer.start()
	
	#Fire a bolt
	'''
	if Input.is_action_pressed("secondary_action") && canFireBolt:
		var mouseDirection = (get_global_mouse_position() - position).normalized()
		boltFired.emit(position, mouseDirection)
		canFireBolt = false
		fireBoltTimer.start()
	'''
	
func _physics_process(_delta):
	
	velocity = direction * maxSpeed
	move_and_slide()

func hit(hitPosition: Vector2, damages: int):
	
	canMove = false
	controlTimer.start()
	
	direction = (position - hitPosition).normalized() * knockback/10
	
	var tween = create_tween()
	tween.tween_property(sprite, "modulate", Color(1, 1, 1, 1), .2).from(Color(1, 0, 0, 1))
	
	Globals.playerHealth -= damages
	
	healthUpdated.emit()
	
	if Globals.playerHealth <= 0:
		Globals.playerHealth = Globals.playerMaxHealth
		get_tree().reload_current_scene()


func _on_fire_bolt_timeout():
	canFireBolt = true


func _on_axe_swing_timeout():
	canSwingAxe = true


func _on_control_timer_timeout():
	canMove = true
