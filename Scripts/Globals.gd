extends Node

signal health_updated
signal money_updated

# STATES
const IDLE = "IDLE"
const MOVE = "MOVE"

var playerMaxHealth: int
var playerHealth: int:
	get:
		return playerHealth
	set(value):
		playerHealth = value
		health_updated.emit()

var moneyAmount: int:
	get:
		return moneyAmount
	set(value):
		moneyAmount = value
		money_updated.emit()

func _ready():
	Globals.playerHealth = Globals.playerMaxHealth
