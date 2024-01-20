extends AnimationPlayer

@onready var animation_player : AnimationPlayer

func _ready():
	animation_player = $AnimationPlayer 
# Method to be called when the button is pressed
func on_button_pressed() -> void:
	# Play the "ButtonPressAnimation" animation
	animation_player.play("ButtonPressAnimation")
