extends CharacterBody2D

@onready var health = 6

const SPEED = 500.0
const JUMP_VELOCITY = -700.0
@onready var sprite_2d = $Sprite2D
@onready var Healthbar = $Helthbar


var gravity = 1300

func _ready():
	
	Healthbar._init_health(health)

func _physics_process(_delta):

		if Input.is_action_just_pressed("punch"):
			sprite_2d.play("punch")
		if Input.is_action_just_pressed("down"):
			sprite_2d.play("kick")
		if Input.is_action_just_pressed("up") and is_on_floor():
				velocity.y = JUMP_VELOCITY
				sprite_2d.play("jump")
		if (velocity.x > 1 || velocity.x < -1):
				sprite_2d.play("run")
	
		if not is_on_floor():
			velocity.y += gravity * _delta
		
	
		var direction = Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, 14)

		move_and_slide()

	
		var is_right = velocity.x < 0
		sprite_2d.flip_h = is_right
