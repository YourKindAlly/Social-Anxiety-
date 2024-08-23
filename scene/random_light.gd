extends PointLight2D

@export var speed : float
@export var within_bounds : Vector2

var new_position : Vector2

func _process(delta):
	position = position.move_toward(new_position, speed * delta)
	
	if new_position != position:
		return
	
	new_position = _random_position()

func _random_position():
	var new_destination : Vector2
	new_destination.x = position.x + randi_range(-100, 100)
	new_destination.y = position.y + randi_range(-100, 100)
	
	if new_destination.x < -within_bounds.x \
	or new_destination.x > within_bounds.x \
	or new_destination.y < -within_bounds.y \
	or new_destination.y > within_bounds.y:
		return position
	else:
		return new_destination
