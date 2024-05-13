extends State

@onready var player = $"../.."
@onready var animation_player = $"../../AnimationPlayer"
@onready var idle_state = $"../IdleState"
@onready var attack_state = $"../AttackState"

func _ready() -> void:
	state_name = "run"

func _enter_state() -> void:
	animation_player.play("run")

func _process_state(delta: float) -> void:
	if(player.input_dir.is_zero_approx()):
		transition.emit(idle_state)
	
	if player.input_attack:
		transition.emit(attack_state)
	
	player.adjust_sprite_side()

func _physics_process_state(delta: float) -> void:
	player.move()