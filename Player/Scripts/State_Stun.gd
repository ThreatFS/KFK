class_name State_Stun extends State

@export var knockback_speed : float = 200.0
@export var deceleration_speed : float = 10.0
@export var invulnerable_duration : float =  1.0

var hurtbox : HurtBox
var direction : Vector2

var next_state : State = null

@onready var idle: State = $"../Idle"


func init() -> void:
	player.player_damaged.connect( _player_damaged )

# Called every frame. 'delta' is the elapsed time since the previous frame.
func Enter() -> void:
	
	player.animation_player.animation_finished.connect( _animation_finished )
	
	direction = player.global_position.direction_to( hurtbox.global_position )
	player.velocity = direction * -knockback_speed
	player.set_direction()
	
	player.UpdateAnimation("stun")
	player.make_invulnerable( invulnerable_duration )
	player.effect_animation_player.play("damaged")
	pass




func Exit() -> void:
	next_state = null
	player.animation_player.animation_finished.disconnect( _animation_finished )
	pass


func Process( _delta: float ) -> State:
	player.velocity -= player.velocity * deceleration_speed * _delta
	return next_state



func Physics( _delta: float ) -> State:
	return null



func HandleInput( _event: InputEvent ) -> State:
	return null

func _player_damaged( _hurtbox : HurtBox) -> void:
	hurtbox = hurtbox
	state_machine.ChangeState( self )
	pass


func _animation_finished(  _a : String ) -> void:
	next_state = idle
