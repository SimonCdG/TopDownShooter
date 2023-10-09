extends Node2D

@onready var boltScene: PackedScene = preload("res://Scenes/Projectiles/bolt.tscn")
@onready var projectilesNode = $Projectiles

func _on_player_bolt_fired(boltPosition, boltDirection):
	var bolt = boltScene.instantiate()
	projectilesNode.add_child(bolt)
	bolt.position = boltPosition
	bolt.rotation = boltDirection.angle()
	bolt.direction = boltDirection


func _on_chest_chest_opened(sprite):
	print(sprite)
	
