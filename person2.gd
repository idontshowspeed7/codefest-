extends CharacterBody2D

const SPEED = 700.0
const JUMP_VELOCITY = -900.0
@onready var sprite_2d = $Sprite2D
var progress_bar : ProgressBar
var initial_value : int = 100



var gravity = 1300

func _ready():
	progress_bar = ProgressBar.new()
	progress_bar.max_value = initial_value
	progress_bar.value = initial_value
	add_child(progress_bar)

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

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		initial_value -= 5
	if Input.is_action_just_pressed("ui_down"):
		initial_value -= 10
	if initial_value <= 0:
		sprite_2d.play("death")
		print ("you died")
