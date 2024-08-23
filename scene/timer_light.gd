extends PointLight2D

var default_position : Vector2
var new_position : Vector2
@export var speed : float

func _ready():
	default_position = position
	new_position = default_position

func _process(delta):
	position = position.move_toward(new_position, speed * delta)
	
	if new_position != position:
		return
	
	new_position = _find_new_destination()

func _find_new_destination():
	if new_position != default_position:
		return default_position
	
	var new_destination : Vector2
	new_destination.x = position.x + randi_range(-10, 10)
	new_destination.y = position.y + randi_range(-10, 10)
	
	return new_destination
