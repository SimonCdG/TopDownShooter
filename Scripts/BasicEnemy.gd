class_name BasicEnemy
extends CharacterBody2D

@export var maxSpeed: float = 50
@export var health: int = 1
@export var knockback: float = 30
@export var damages: int = 1
@export var itemDropScene: PackedScene = preload("res://Scenes/Mechanisms/dropped_items.tscn")

@onready var sprite = $Sprite2D
@onready var deathScene: PackedScene = preload("res://Scenes/Effects/death_effect.tscn")

var direction: Vector2

func _physics_process(delta):
	
	direction = lerp(direction, Vector2.ZERO, 10 * delta)
	
	velocity = direction * maxSpeed
	move_and_slide()

func hit(hitPosition: Vector2, damage: int):
	direction = (position - hitPosition).normalized() * knockback/10
	
	var tween = create_tween()
	tween.tween_property(sprite, "modulate", Color(1, 1, 1, 1), .2).from(Color(1, 0, 0, 1))
	
	health -= damage
	if health <= 0:
		#Death Effect
		var deathEffect = deathScene.instantiate()
		$"..".add_child(deathEffect)
		deathEffect.position = position
		
		#Item Drop
		var itemDropDice = randf()
		
		if itemDropDice < .5:
			pass
		else:
			var itemDrop = itemDropScene.instantiate()
			$"..".call_deferred('add_child', itemDrop)
			itemDrop.position = position
			itemDrop.direction = (global_position - hitPosition).normalized()
			if itemDropDice < .9:
				itemDrop.call_deferred('determine_state', 0)
			else:
				itemDrop.call_deferred('determine_state', 1)
		
		queue_free()
