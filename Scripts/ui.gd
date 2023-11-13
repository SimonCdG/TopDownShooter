extends CanvasLayer

@onready var healthUI: TextureProgressBar = $HealthMargin/HealthTexture
@onready var moneyUI: Label = $MoneyCount/RupeeCount

func _ready():
	#health UI
	healthUI.max_value = Globals.playerMaxHealth
	healthUI.value = Globals.playerHealth
	Globals.connect("health_updated", update_health_ui)
	Globals.connect("money_updated", update_money_ui)
	
	#money UI
	moneyUI.text = str(Globals.moneyAmount)

func update_health_ui():
	healthUI.value = Globals.playerHealth
	if healthUI.value < healthUI.max_value/5:
		$AnimationPlayer.play("low_health")
	else:
		$AnimationPlayer.play("RESET")

func update_money_ui():
	moneyUI.text = str(Globals.moneyAmount)
