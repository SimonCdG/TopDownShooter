extends Area2D

@export var scene: PackedScene

func _on_body_entered(body):
	if "maxSpeed" in body:
		body.maxSpeed = 0
		LevelTransition.level_transition(scene)
