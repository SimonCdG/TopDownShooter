extends Node2D
@export var trigger: int


func _on_ghost_trigger_signal():
	trigger -= 1
	if trigger <=0:
		$AnimatedSprite2D.play("opened")
		$Temporary/mid.call_deferred("set_disabled", true)
	
