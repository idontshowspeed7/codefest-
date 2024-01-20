extends CharacterBody2D

const SPEED = 500.0
const JUMP_VELOCITY = -700.0
@onready var sprite_2d = $Sprite2D

# Gravity variable
var gravity = 1900

# Keep track of the current animation state
var current_animation = "idle"

func _physics_process(_delta):
	#default and run
	if (velocity.x >1 || velocity.x <-1):
		play_animation ("run")
	else:
		play_animation ("default")
	
	# Check for jump and attacks.
		if Input.is_action_just_pressed("ui_up") and is_on_floor():
			play_animation("jump")
		velocity.y = JUMP_VELOCITY
		if Input.is_action_just_pressed("ui_accept"):
			play_animation("punch")
		if Input.is_action_just_pressed("ui_down"):
			play_animation("kick")
	

	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * _delta

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 14)

	move_and_slide()

	# Flip the sprite based on the movement direction.
	var is_left = velocity.x < 0
	sprite_2d.flip_h = is_left

# Function to play animations
func play_animation(animation_name: String) -> void:
	# Check if the requested animation is different from the current one
	if current_animation != animation_name:
		sprite_2d.play(animation_name)
		current_animation = animation_name
