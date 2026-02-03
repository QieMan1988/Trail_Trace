class_name PlayerCharacter
extends CharacterBody2D

@export var speed: float = 300.0
@export var acceleration: float = 1200.0
@export var friction: float = 1200.0

func _physics_process(delta: float) -> void:
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if input_dir != Vector2.ZERO:
		velocity = velocity.move_toward(input_dir * speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	move_and_slide()
