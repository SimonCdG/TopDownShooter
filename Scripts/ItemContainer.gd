class_name ItemContainer
extends StaticBody2D

@export var isDestroyable: bool
@export var deathScene: PackedScene = preload("res://Scenes/Effects/death_effect.tscn") 

func hit(_position, _damage):
	if isDestroyable:
		var deathEffect = deathScene.instantiate()
		$"..".add_child(deathEffect)
		deathEffect.position = position
		queue_free()
	else:
		pass
