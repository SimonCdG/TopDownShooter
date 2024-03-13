extends Node
class_name State

signal transitioned
@onready var enemy:CharacterBody2D = get_parent().get_parent()
@export var canBeInterrupted = true
var hasEntered = false

func Enter():
	pass

func Update(_delta:float):
	pass

func Physics_Update(_delta:float):
	pass

func Exit():
	pass
