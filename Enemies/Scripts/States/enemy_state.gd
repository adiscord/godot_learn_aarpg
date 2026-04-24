class_name EnemyState extends Node

var character: Enemy
var enemy_state_machine: EnemyStateMachine

func initialize(input_character: Enemy, state_machine: EnemyStateMachine):
	character = input_character
	enemy_state_machine = state_machine

func enter_state() -> void:
	pass
	
func exit_state() -> void:
	pass
	
func process(_delta: float) -> EnemyState:
	return null
	
func physics_process(_delta: float) -> EnemyState:
	return null
