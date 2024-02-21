extends Node


@export var current_state: State
var states: Dictionary = {}

func _ready():
	for child in get_children():
		if child is State:
			states[child.name] = child
			child.transitioned.connect(on_child_transition)
	current_state.Enter()

func _process(delta):
	if current_state:
		current_state.Update(delta)

func _physics_process(delta):
	if current_state:
		current_state.Physics_Update(delta)

func on_child_transition(_newState):
	
	current_state.Exit()
	
	if states.get(_newState):
		current_state = states.get(_newState)
	
	current_state.Enter()
