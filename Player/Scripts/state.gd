class_name State extends Node

static var player: Player

func enter_state() -> void:
	pass
	
func exit_state() -> void:
	pass
	
func process(delta: float) -> State:
	return null
	
func physics_process(delta: float) -> State:
	return null
	
func handle_input(event: InputEvent) -> State:
	return null
