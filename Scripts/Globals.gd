extends Node

signal health_updated

var playerMaxHealth: int
var playerHealth: int:
	get:
		return playerHealth
	set(value):
		playerHealth = value
		health_updated.emit()

func _ready():
	Globals.playerHealth = Globals.playerMaxHealth
