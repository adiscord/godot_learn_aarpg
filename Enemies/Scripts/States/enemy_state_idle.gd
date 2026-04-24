class_name EnemyStateIdle extends EnemyState 

@export_category("AI")
@export var state_duration_min: float = 0.5
@export var state_duration_max: float = 1.5
@export var next_state: EnemyState

var _timer: float = 0.0

func enter_state() -> void:
	character.velocity = Vector2.ZERO
	_timer = randf_range(state_duration_min, state_duration_max)
	character.update_animation('idle')
	pass
	
func exit_state() -> void:
	pass
	
func process(delta: float) -> EnemyState:
	_timer -= delta
	
	if (_timer <= 0):
		return next_state
	
	character.velocity = Vector2.ZERO
	return null
	
func physics_process(_delta: float) -> EnemyState:
	return null
	
