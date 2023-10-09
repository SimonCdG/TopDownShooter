class_name BasicEnemy
extends CharacterBody2D

@export var maxSpeed: float = 50
@export var health: int = 1
@export var knockback: float = 30

@onready var sprite = $Sprite2D
@onready var deathScene: PackedScene = preload("res://Scenes/Effects/death_effect.tscn")

var direction: Vector2

func _physics_process(delta):
	
	direction = lerp(direction, Vector2.ZERO, 10 * delta)
	
	velocity = direction * maxSpeed
	move_and_slide()

func hit(hitPosition, damage):
	direction = (position - hitPosition).normalized() * knockback/10
	
	var tween = create_tween()
	tween.tween_property(sprite, "modulate", Color(1, 1, 1, 1), .2).from(Color(1, 0, 0, 1))
	
	health -= damage
	if health <= 0:
		var deathEffect = deathScene.instantiate()
		$"..".add_child(deathEffect)
		deathEffect.position = position
		queue_free()
