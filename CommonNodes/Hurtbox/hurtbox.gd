class_name Hurtbox extends Area2D

@export var damage: int = 1

func _ready() -> void:
	area_entered.connect(on_area_entered)

func on_area_entered(area: Area2D) -> void:
	print("area_entered: ", area)
	if area is Hitbox:
		area.take_damage(damage)
