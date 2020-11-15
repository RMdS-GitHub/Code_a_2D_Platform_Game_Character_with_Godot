extends State
"""
Horizontal movement on the ground.
Delegates movement to its parent Move state and extends it
with state transitions
"""


export var max_speed_sprint: = 900.0


func unhandled_input(event: InputEvent) -> void:
	var move: = get_parent()
	move.unhandled_input(event)
	

func physics_process(delta: float) -> void:
	var move: = get_parent()
	move.max_speed.x = max_speed_sprint if Input.is_action_pressed("sprint") else move.max_speed_default.x
	
	if owner.is_on_floor() and move.velocity.length() < 1.0:
		_state_machine.transition_to("Move/Idle")
	else:
		_state_machine.transition_to("Move/Air")
	move.physics_process(delta)
	
	
func enter(msg: Dictionary = {}) -> void:
	get_parent().enter(msg)
	
	
func exit() -> void:
	get_parent().exit()
	



