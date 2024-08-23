extends CharacterBody2D

@export var idle : Timer
@export var despawn : Timer

@export var within_bounds : Vector2
@export var movement_speed : float

@export var stage : CharacterStage

@export var animation : AnimatedSprite2D

var new_destination := Vector2(0, 0)
var is_walking := false

@export var spawn_range : Vector2
@export var stages : Array[CharacterStage]

@export var quotes : Array[String]
@export var quote_label : Label
@export var quote_timer : Timer

func _ready():
	position.x = randf_range(-spawn_range.x, spawn_range.x)
	position.y = randf_range(-spawn_range.y, spawn_range.y)
	
	var stage_index = randi_range(0, 2)
	
	stage = stages[stage_index]
	modulate = stage.character_color

func _process(delta):
	if not is_walking:
		return
	
	position = position.move_toward(new_destination, movement_speed * delta)
	
	if position == new_destination:
		is_walking = false
		idle.start()

func _on_collider_entered(body):
	if body.name == "Player" && body.current_stage == stage:
		SignalControl.socializing.emit()
		despawn.start()
		
	elif body.name == "Player":
		SignalControl.change_score.emit(-1)
		var index = randi_range(0, 3)
		quote_label.text = quotes[index]
		quote_timer.start()

func _on_despawn_timeout():
	SignalControl.change_score.emit(1)
	queue_free()

func _on_idle_timeout():
	new_destination = _find_new_destination()
	
	is_walking = true
	
	animation.play("default")

func _find_new_destination():
	new_destination.x = position.x + randi_range(-100, 100)
	new_destination.y = position.y + randi_range(-100, 100)
	
	if new_destination.x < -within_bounds.x \
	or new_destination.x > within_bounds.x \
	or new_destination.y < -within_bounds.y \
	or new_destination.y > within_bounds.y:
		return position
	else:
		return new_destination


func _on_timer_timeout():
	quote_label.text = ""
