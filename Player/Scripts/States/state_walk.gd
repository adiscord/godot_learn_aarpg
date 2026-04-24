class_name StateWalk extends State

@onready var state_idle: State = $"../Idle"
@onready var state_attack: State = $"../Attack"

@export var move_speed: float = 100
@export var sprint_speed: float = 500

var is_shift_pressed: bool = false

func enter_state() -> void:
	player.update_animation('walk')
	pass
	
func exit_state() -> void:
	is_shift_pressed = false
	pass

func process(_delta: float) -> State:
	is_shift_pressed = Input.is_action_pressed('sprint')
	
	if player.direction == Vector2.ZERO:
		return state_idle
	var new_speed = move_speed if !is_shift_pressed else sprint_speed
	player.velocity = player.direction * new_speed
	
	if player.set_direction():
		player.update_animation("walk")
	
	return null
	
func physics_process(_delta: float) -> State:
	return null
	
func handle_input(event: InputEvent) -> State:	
	if event.is_action_pressed("attack"):
		return state_attack
	
	return null
