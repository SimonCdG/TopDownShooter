extends CharacterBody2D
class_name Enemy

@export var health: int
@export var max_speed: int
@export_range(0, 500) var aggro_range : int
@export_range(0, 500) var release_range : int
@export_range(-100, 100) var knockback_resistance: int = 0
@export_range(-100, 100) var damages_resistance: int = 0
@export var damages: float

@onready var sprite2d = $Sprite2D
@onready var worldCollision = $WorldCollision
@onready var hurtbox = $Hurtbox
@onready var states = $States

@onready var player: CharacterBody2D

var stateDictionary = {}
var currentState = State
