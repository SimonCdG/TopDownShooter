extends Node
class_name StateMachine

@export var initial_state: State
@export var states: Array[State]
var current_state: State

func _ready():
	current_state = initial_state
	current_state.enter()

