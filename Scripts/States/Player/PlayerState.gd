extends State
class_name PlayerState

@onready var player: CharacterBody2D = owner
@onready var animation_player: AnimationPlayer = owner.find_child("AnimationPlayer")
var direction: Vector2

func _ready():
	pass
