class_name StateWalk extends State

@onready var state_idle: State = $"../Idle"
@onready var state_attack: State = $"../Attack"

@export var move_speed: float = 100

func enter_state() -> void:
	player.update_animation('walk')
	pass
	
func exit_state() -> void:
	pass
	
func process(delta: float) -> State:
	if player.direction == Vector2.ZERO:
		return state_idle
	
	player.velocity = player.direction * move_speed
	
	if player.set_direction():
		player.update_animation("walk")
	
	return null
	
func physics_process(delta: float) -> State:
	return null
	
func handle_input(event: InputEvent) -> State:
	if event.is_action_pressed("attack"):
		return state_attack
	
	return null
