class_name Hitbox
extends Area2D

func damages_calculation(body, damagesDealt:int):
	var baseDamages = damagesDealt
	var diceRoll = randf()
	if diceRoll < .1:
		damagesDealt *= .5
	elif diceRoll < .4:
		damagesDealt *= .8
	elif diceRoll < .7:
		pass
	elif diceRoll < .95:
		damagesDealt *= 1.2
	else:
		damagesDealt *= 2
		
	body.hit(position, damagesDealt)
	print(damagesDealt)
	damagesDealt = baseDamages
