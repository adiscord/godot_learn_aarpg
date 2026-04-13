class_name Player extends CharacterBody2D

var cardinal_direction: Vector2 = Vector2.DOWN
var direction: Vector2 = Vector2.ZERO

signal direction_changed_signal(direction: Vector2)

func _ready() -> void:
	$PlayerStateMachine.initialize(self)
	pass 

func _process(delta: float) -> void:	
	direction = Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	).normalized()

	
func _physics_process(delta: float) -> void:
	move_and_slide()

func update_animation(state: String) -> void:	
	$AnimationPlayer.play(state + "_" + get_amimation_direction())
	

func set_direction() -> bool:
	var new_dir: Vector2 = cardinal_direction
	
	if direction == Vector2.ZERO:
		return false
		
	if direction.y == 0:
		new_dir = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	elif direction.x == 0:
		new_dir = Vector2.UP if direction.y < 0 else Vector2.DOWN
		
	if (cardinal_direction == new_dir):
		return false
	
	cardinal_direction = new_dir
	direction_changed_signal.emit(cardinal_direction)
	
	$Sprite2D.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1
	
	return true

	
func get_amimation_direction() -> String:
	if (cardinal_direction == Vector2.DOWN):
		return 'down'
	elif (cardinal_direction == Vector2.UP):
		return 'up'
	else:
		return 'side'
	
