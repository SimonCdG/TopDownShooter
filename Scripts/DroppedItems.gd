extends Area2D

@export var textures: Array[Texture] = []
@onready var sprite: Sprite2D = $Sprite2D

enum {
	RUPEE,
	HEART
}

var state = RUPEE
var direction = Vector2.RIGHT

func _ready():
	var target_position = create_tween()
	target_position.tween_property(self, 'global_position', global_position + 20 * direction, .8).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUINT)

func determine_state(value):
	
	state = value
	
	match state:
		RUPEE:
			sprite.texture = textures[0]
		HEART:
			sprite.texture = textures[1]

func _on_body_entered(_body):
	
	match state:
		RUPEE:
			Globals.moneyAmount += 1
		HEART:
			Globals.playerHealth += 3
	
	queue_free()
