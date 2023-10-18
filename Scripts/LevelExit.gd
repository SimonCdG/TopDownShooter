extends Area2D

@export_file("*.tscn") var scene

func _on_body_entered(body):
	if "maxSpeed" in body:
		body.maxSpeed = 0
	LevelTransition.level_transition(scene)
