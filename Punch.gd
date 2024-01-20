extends AnimationPlayer

var animation_player : AnimationPlayer

func _ready():
	animation_player = $animationplayer 

	if Input.is_action_just_pressed("ui_down"):
		animation_player.play("punch")
