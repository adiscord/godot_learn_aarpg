class_name EnemyStateMachine extends Node

var states: Array[EnemyState]
var prev_state: EnemyState
var current_state: EnemyState

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED

func _process(delta: float) -> void:
	change_state(current_state.process(delta))
	
func _physics_process(delta: float) -> void:
	change_state(current_state.physics_process(delta))

func initialize(character: Enemy) -> void:
	states = []
	
	for c in get_children():
		if c is EnemyState:
			states.append(c)
			
	for state in states:
		state.initialize(character, self)
	
	if states.size() > 0:
		change_state(states[0])
		process_mode = Node.PROCESS_MODE_INHERIT
	
func change_state(new_state: EnemyState) -> void:
	if new_state == null or current_state == new_state:
		return
		
	if current_state:
		current_state.exit_state()

	prev_state = current_state
	current_state = new_state
	current_state.enter_state()
