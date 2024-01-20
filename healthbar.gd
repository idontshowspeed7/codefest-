extends Area2D

# Player variables
var maxHealth : int = 100
var currentHealth : int = maxHealth

# Function to handle taking damage
func takeDamage(damage: int) -> void:
	currentHealth -= damage
	if currentHealth <= 0:
	 
		queue_free()
		print("YOU DIED")

# Called when the Area2D area enters another area
func _on_Hitbox_area_entered(area: Area2D) -> void:
	# Check if the entered area is an enemy
	if area.has_method("getDamage"):
		# Get the damage value from the enemy and call takeDamage
		var damage = area.getDamage()
		takeDamage(damage)



