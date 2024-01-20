extends CharacterBody2D

const SPEED = 500.0
const JUMP_VELOCITY = -700.0
@onready var sprite_2d = $Sprite2D

# Gravity variable
var gravity = 1900


func _physics_process(_delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * _delta

	# Handle jump and attacks.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		sprite_2d.play("jump")
		velocity.y = JUMP_VELOCITY
	

	if Input.is_action_just_pressed("ui_accept"):
			sprite_2d.play("punch")
	if Input.is_action_just_pressed("ui_down"):
			sprite_2d.play("kick")
			
	else: 
		sprite_2d.play("default")
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
