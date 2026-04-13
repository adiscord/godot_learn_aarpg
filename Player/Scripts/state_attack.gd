class_name StateAttack extends State

@export var attack_sound: AudioStream
@export_range(1, 20, 0.5) var decelerate_speed: float = 5

@onready var state_idle: State = $"../Idle"
@onready var state_walk: State = $"../Walk"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var attack_animation_player: AnimationPlayer = $"../../Sprite2D/AttackEffect/AnimationPlayer"
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"
@onready var hurtbox: Hurtbox = $"../../Interations/Hurtbox"

var is_attacking: bool = false

func enter_state() -> void:
	player.update_animation('attack')
	is_attacking = true
	attack_animation_player.play("attack" + "_" + player.get_amimation_direction())
	audio_stream_player_2d.stream = attack_sound
	audio_stream_player_2d.play()
	audio_stream_player_2d.pitch_scale = randf_range(0.9, 1.1)
	
	await get_tree().create_timer(0.1).timeout
	hurtbox.monitoring = true
	
	await animation_player.animation_finished
	is_attacking = false
	hurtbox.monitoring = false
	pass

	
func exit_state() -> void:
	is_attacking = false
	pass
	
func process(delta: float) -> State:
	player.velocity -=  player.velocity	* decelerate_speed * delta
	
	if not is_attacking:
		if player.direction == Vector2.ZERO:
			return state_idle
		else:
			return state_walk
	return null
	
func physics_process(delta: float) -> State:
	return null
	
func handle_input(event: InputEvent) -> State:
	return null
