class_name ItemContainer
extends StaticBody2D

@export var isDestroyable: bool

func hit(_position, _damage):
	if isDestroyable:
		queue_free()
	else:
		pass
