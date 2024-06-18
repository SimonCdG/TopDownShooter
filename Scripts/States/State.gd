extends Node
class_name State

signal exit_state

func enter():
	pass

func exit(new_state):
	pass

func _ready():
	set_process(false)
	set_physics_process(false)
