class_name Enemy extends CharacterBody2D

signal direction_changed(direction: Vector2)
signal enemy_damaged()

const DIRECTIONS_4: Array[Vector2] = [Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP]

@export var hp: int = 3

var player: Player
var cardinal_direction: Vector2 = Vector2.DOWN
var direction: Vector2 = Vector2.ZERO

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var slime_sprite_2d: Sprite2D = $SlimeSprite2D
@onready var enemy_state_machine: EnemyStateMachine = $EnemyStateMachine

func _ready() -> void:
	enemy_state_machine.initialize(self)
	player = PlayerManager.player

func _physics_process(_delta: float) -> void:
	move_and_slide()
	
func set_direction(requested_direction: Vector2) -> bool:
	if direction == Vector2.ZERO:
		return false
	
	direction = requested_direction;
	
	var direction_id: int = int(round(((direction + cardinal_direction * 0.1).angle() / TAU * DIRECTIONS_4.size())))

	var new_direction = DIRECTIONS_4[direction_id]
		
	if (cardinal_direction == new_direction):
		return false
	
	cardinal_direction = new_direction
	
	slime_sprite_2d.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1
	
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
