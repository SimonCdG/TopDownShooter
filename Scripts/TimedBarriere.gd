extends Node2D

@export var trigger:int
@export var chronoTime:float

@onready var triggerSave = trigger

func _on_trigger_signal():
	trigger -= 1
	if trigger <= 0:
		$Timer.wait_time = chronoTime
		$Timer.start()
		$AnimatedSprite2D.play("opened")
		$Temporary/mid.call_deferred("set_disabled", true)


func _on_timer_timeout() -> void:
	trigger = triggerSave
	$Timer.wait_time = chronoTime
	$AnimatedSprite2D.play("closed")
	$Temporary/mid.call_deferred("set_disabled", false)
