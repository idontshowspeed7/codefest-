extends CharacterBody2D

const SPEED = 500.0
const JUMP_VELOCITY = -700.0
const GRAVITY = 1300.0

@onready var sprite_2d = $Sprite2D

var velocity = Vector2()

func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		sprite_2d.play("punch")
	if Input.is_action_just_pressed("ui_down"):
		sprite_2d.play("kick")
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		sprite_2d.play("jump")
	if abs(velocity.x) > 1:
		sprite_2d.play("run")
	
	if not is_on_floor():
		velocity.y += GRAVITY * _delta
	
	var direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.x = direction * SPEED
	
	move_and_slide(velocity, Vector2(0, -1))
	
	var is_left = velocity.x < 0
	sprite_2d.flip_h = is_left

