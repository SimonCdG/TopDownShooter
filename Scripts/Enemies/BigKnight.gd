extends Enemy

func _ready():
	player = get_tree().get_first_node_in_group("Player")
	for n in states.get_child_count():
		stateDictionary[states.get_child(n).name] =  states.get_child(n)
	currentState = stateDictionary["EnemyIdle"]
	currentState.Enter()
	
func _process(delta):
	currentState.Update(delta)
	var playerDistance = position.distance_to(player.position)
	#print(playerDistance)
	#print(aggro_range)
	if playerDistance < aggro_range:
		currentState = stateDictionary["EnemyChase"]
		currentState.Enter()

func _physics_process(delta):
	currentState.Physics_Update(delta)
	move_and_slide()

func _on_enemy_idle_transitioned():
	currentState = stateDictionary["EnemyWander"]
	currentState.Enter()

func _on_enemy_wander_transitioned():
	currentState = stateDictionary["EnemyIdle"]
	currentState.Enter()

func _on_enemy_chase_transitioned():
	currentState = stateDictionary["EnemyIdle"]
	currentState.Enter()
