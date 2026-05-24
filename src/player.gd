extends CharacterBody2D


@export var speed = 500.0
@export var dash_factor = 6

func _physics_process(delta: float) -> void:
	var movement_dir = Input.get_vector("left", "right", "front", "back")

	if movement_dir != Vector2.ZERO:
		if Input.is_action_just_pressed("dash"):
			velocity = movement_dir * speed * dash_factor
		velocity = max(velocity.move_toward(Vector2.ZERO, speed).length(),  speed)*movement_dir
		if velocity > speed*movement_dir:
			collision_layer = 0
		else:
			collision_layer = 1
	else:
		velocity = Vector2.ZERO

	move_and_slide()