class_name EnemyStateAttack extends EnemyState 


func enter_state() -> void:
	character.update_animation('idle')
	pass
	
func exit_state() -> void:
	pass
	
func process(_delta: float) -> EnemyState:
	return null
	#if player.direction != Vector2.ZERO:
		#return state_walk
	#
	#player.velocity = Vector2.ZERO
	#return null
	
func physics_process(_delta: float) -> EnemyState:
	return null
	
func handle_input(_event: InputEvent) -> EnemyState:
	#if event.is_action_pressed("attack"):
		#return state_attack
	return null
