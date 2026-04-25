class_name EnemyStateWander extends EnemyState 

@export var wander_speed: float = 20

@export_category("AI")
@export var state_duration: float = 0.7
@export var state_cycles_min: int = 1
@export var state_cycles_max: int = 3
@export var next_state: EnemyState


var _timer: float = 0.0
var _direction: Vector2

func enter_state() -> void:
	_timer = randi_range(state_cycles_min, state_cycles_max) * state_duration
	var rand = randi_range(0, 3);
	_direction = character.DIRECTIONS_4[rand]
	character.set_direction(_direction)
	character.velocity = _direction * wander_speed
	character.update_animation('wander')
	pass
	
func exit_state() -> void:
	pass
	
func process(delta: float) -> EnemyState:
	_timer -= delta
	
	if _timer <= 0:
		return next_state
	return null
	
func physics_process(_delta: float) -> EnemyState:
	return null
	
func handle_input(_event: InputEvent) -> EnemyState:
	return null
