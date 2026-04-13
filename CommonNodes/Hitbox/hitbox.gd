class_name Hitbox extends Area2D

signal damaged_signal(damage: int)

func take_damage(damage: int) -> void:
	print("taken damage: ", damage)
	damaged_signal.emit(damage)
