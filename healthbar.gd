extends CharacterBody2D

@onready var health_bar = $HealthBar  # Reference to the HealthBar node

func _ready():
	pass

# Call this function when the player takes damage
func take_damage(damage : int):
	health_bar.take_damage(damage)

# Call this function when the player heals
func heal(healing : int):
	health_bar.heal(healing)


