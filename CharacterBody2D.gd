extends CharacterBody2D

const SPEED = 500.0
const JUMP_VELOCITY = -700.0
@onready var sprite_2d = $Sprite2D

# Gravity variable
var gravity = 1900

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump and attacks.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Check if the "punch" animation exists in the AnimationPlayer.
		if Input.is_action_just_pressed("ui_accept"):
			# Play the "punch" animation
			sprite_2d.play("punch")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 14)

	move_and_slide()

	# Flip the sprite based on the movement direction.
	var is_left = velocity.x < 0
	sprite_2d.flip_h = is_left
