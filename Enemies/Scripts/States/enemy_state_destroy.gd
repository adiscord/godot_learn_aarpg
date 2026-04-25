class_name EnemyStateDestory extends EnemyState 

@export var knockback_speed : float = 200.0
@export var decelerate_speed: float = 10.0

@export_category("AI")
@export var next_state: EnemyState

var _direction: Vector2
var _animation_finished: bool = false

func initialize(input_character: Enemy, state_machine: EnemyStateMachine) -> void:
	super(input_character, state_machine)
	character.enemy_destroyed_signal.connect(onDead)

func enter_state() -> void:
	character.update_animation('destroy')
	_direction = character.global_position.direction_to(character.player.position) * -1
	character.set_direction(_direction)
	character.velocity = _direction * knockback_speed
	await character.animation_player.animation_finished
	_animation_finished = true
	pass
	
func exit_state() -> void:
	_animation_finished = false

func process(delta: float) -> EnemyState:
	if _animation_finished:
		character.queue_free()
		return null

	character.velocity -= character.velocity * decelerate_speed * delta
	return null
	
func physics_process(_delta: float) -> EnemyState:
	return null
	
func handle_input(_event: InputEvent) -> EnemyState:
	return null
	
func onDead()-> void:
	enemy_state_machine.change_state(self)
