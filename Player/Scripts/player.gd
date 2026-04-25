class_name Player extends CharacterBody2D

const DIRECTIONS_4: Array[Vector2] = [Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP]

@onready var player_state_machine: PlayerStateMachine = $PlayerStateMachine
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var hitbox: Hitbox = %Hitbox

var cardinal_direction: Vector2 = Vector2.DOWN
var direction: Vector2 = Vector2.ZERO

@export var hp: int = 10

func _ready() -> void:
	PlayerManager.player = self
	player_state_machine.initialize(self)
	hitbox.damaged_signal.connect(takeDamage)
	pass 

func _process(_delta: float) -> void:	
	direction = Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	).normalized()

func takeDamage(damage: int) -> void:
	hp -= damage
	if (hp <= 0):
		queue_free()
	
func _physics_process(_delta: float) -> void:
	move_and_slide()


func set_direction() -> bool:
	if direction == Vector2.ZERO:
		return false
		
	var direction_id: int = int(round(((direction + cardinal_direction * 0.1).angle() / TAU * DIRECTIONS_4.size())))

	var new_direction = DIRECTIONS_4[direction_id]
		
	if (cardinal_direction == new_direction):
		return false
	
	cardinal_direction = new_direction
	
	sprite_2d.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1
	
	return true
	
func update_animation(state: String) -> void:	
	animation_player.play(state + "_" + get_amimation_direction())
	
func get_amimation_direction() -> String:
	if (cardinal_direction == Vector2.DOWN):
		return 'down'
	elif (cardinal_direction == Vector2.UP):
		return 'up'
	else:
		return 'side'
	
