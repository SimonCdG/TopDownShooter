extends StaticBody2D

@onready var chestSprite: Sprite2D = $Sprite2D
@onready var starParticles: CPUParticles2D = $StarParticles
@export var openedChestSprite: Texture2D

var chestOpened: bool = false

signal chest_opened(Sprite2D)


func _on_open_the_chest_body_entered(body):
	if body is Player && chestOpened == false:
		var tween = create_tween()
		tween.set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(chestSprite, "scale", Vector2(0.8,1.3), 0.1).set_ease(Tween.EASE_OUT)
		tween.tween_property(chestSprite, "scale", Vector2(1.05,0.95), 0.1)
		tween.tween_property(chestSprite, "scale", Vector2(1,1), 0.1)
		chest_opened.emit(chestSprite)
		starParticles.restart()
		chestSprite.texture = openedChestSprite
		chestOpened = true
