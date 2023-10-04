extends Node2D

@onready var boltScene: PackedScene = preload("res://Scenes/Projectiles/bolt.tscn")
@onready var projectilesNode = $Projectiles

func _on_player_bolt_fired(position, direction):
	var bolt = boltScene.instantiate()
	projectilesNode.add_child(bolt)
	bolt.position = position
	bolt.rotation = direction.angle()
	bolt.direction = direction
