class_name EnemyState extends Node


## Stores a reference to the enemy that this state belongs to
var enemy : Enemy
var state_machine : EnemyStateMachine


##What happens when we initialize the state?
func init() -> void:
	pass


##What happens when the enemy enters this state?
func enter() -> void:
	pass


##What happens when the enemy exits this state?
func exit() -> void:
	pass



func process( _delta: float ) -> EnemyState:
	return null



func physics( _delta: float ) -> EnemyState:
	return null
