class_name StateIdle extends State 

@onready var state_walk: State = $"../Walk"
@onready var state_attack: State = $"../Attack"

func enter_state() -> void:
	player.update_animation('idle')
	pass
	
func exit_state() -> void:
	pass
	
func process(delta: float) -> State:
	if player.direction != Vector2.ZERO:
		return state_walk
	
	player.velocity = Vector2.ZERO
	return null
	
func physics_process(delta: float) -> State:
	return null
	
func handle_input(event: InputEvent) -> State:
	if event.is_action_pressed("attack"):
		return state_attack
	return null
