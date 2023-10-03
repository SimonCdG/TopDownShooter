extends StaticBody2D

@onready var chestSprite: Sprite2D = $Sprite2D
@export var openedChestSprite: Texture2D

var chestOpened: bool = false


func _on_open_the_chest_body_entered(body):
	if body is Player && chestOpened == false:
		chestSprite.texture = openedChestSprite
		chestOpened = true
