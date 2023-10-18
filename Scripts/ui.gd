extends CanvasLayer

@onready var healthUI: TextureProgressBar = $HealthMargin/HealthTexture

func _ready():
	healthUI.max_value = Globals.playerMaxHealth
	healthUI.value = Globals.playerHealth

