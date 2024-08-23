extends PointLight2D

@export var player : Player
@export var speed : float

func _process(delta):
	position = position.move_toward(player.position, speed * delta)
