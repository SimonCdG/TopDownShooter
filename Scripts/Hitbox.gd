class_name Hitbox
extends Area2D

func damages_calculation(body, damagesDealt:int):
	var baseDamages = damagesDealt
	var diceRoll = randf()
	if diceRoll < 0.1:
		damagesDealt = int(damagesDealt * 0.6)
	elif diceRoll < 0.4:
		damagesDealt = int(damagesDealt * 0.8)
	elif diceRoll < .7:
		pass
	elif diceRoll < .95:
		damagesDealt = int(damagesDealt * 1.2)
	else:
		damagesDealt *= 2
		
	body.hit(global_position, damagesDealt)
	damagesDealt = baseDamages
