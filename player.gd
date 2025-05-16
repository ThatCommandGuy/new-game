extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -150.0
var jumps : int = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if is_on_floor():
		jumps = 0
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and jumps <2:
		velocity.y = JUMP_VELOCITY
		jumps += 1 
	print(jumps)
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
