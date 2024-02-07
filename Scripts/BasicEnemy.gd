class_name BasicEnemy
extends CharacterBody2D

signal triggerSignal

@export var maxSpeed: float = 50
@export var health: int = 1
@export var knockback: float = 30
@export var damages: int = 1
@export var itemDropScene: PackedScene = preload("res://Scenes/Mechanisms/dropped_items.tscn")

@onready var sprite = $Sprite2D
@onready var deathScene: PackedScene = preload("res://Scenes/Effects/death_effect.tscn")
@onready var timer = $Timer
var return_to_start = false
var startpostion: Vector2
var direction: Vector2
var vue: bool = false
var attack = false
var pos_diferse = 20
func _ready():
	startpostion = position
func diferen():
	return true if abs(startpostion.x) - abs(position.x) < pos_diferse and abs(startpostion.y) - abs(position.y) < pos_diferse else false
func _physics_process(delta):
	direction = lerp(direction, Vector2.ZERO, 10 * delta)
	if vue and not return_to_start:
		direction = (Globals.playerposition - position).normalized()
	elif return_to_start == true:
		if diferen():
			return_to_start = false
		else:
			direction = (startpostion - position).normalized()
	
	velocity = direction * maxSpeed
	move_and_slide()

func hit(hitPosition: Vector2, damage: int):
	vue = false
	attack = true
	timer.start()
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
		
		triggerSignal.emit()
		
		queue_free()


func _on_vue_body_entered(body):
	vue = true
	return_to_start = false


func _on_nomorelook_body_exited(body):
	vue = false
	return_to_start = true


func _on_timer_timeout():
	vue = true
