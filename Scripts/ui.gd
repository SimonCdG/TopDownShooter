extends CanvasLayer

@onready var healthUI: TextureProgressBar = $HealthMargin/HealthTexture

func _ready():
	healthUI.max_value = Globals.playerMaxHealth
	healthUI.value = Globals.playerHealth
	Globals.connect("health_updated", update_health_ui)

func update_health_ui():
	healthUI.value = Globals.playerHealth
	if healthUI.value < healthUI.max_value/5:
		$AnimationPlayer.play("low_health")
	else:
		$AnimationPlayer.play("RESET")
