class_name Player extends CharacterBody2D

var input : Vector2

const INPUT_LEFT := "move_left"
const INPUT_RIGHT := "move_right"
const INPUT_UP := "move_up"
const INPUT_DOWN := "move_down"

@export var move_speed : float

var current_score : int

@export var stages : Array[CharacterStage]
var stage_index : int = 1

@export var current_stage : CharacterStage

@export var ouch : Label
@export var timer : Timer

var game_over : bool

func _ready():
	SignalControl.change_score.connect(_on_score_changed)
	SignalControl.game_over.connect(_on_game_over)

func _process(delta) -> void:
	_player_movement(delta)

func _player_movement(delta : float) -> void:
	if game_over:
		return
	
	input = Input.get_vector(INPUT_LEFT, INPUT_RIGHT, INPUT_UP, INPUT_DOWN)
	var movement : Vector2 = input * move_speed * delta
	
	move_and_collide(movement)

func _on_score_changed(amount : int):
	if game_over:
		return
	
	current_score += amount
	
	if amount < 0:
		ouch.visible = true
		timer.start()
		return
	
	if current_score == current_stage.amount_to_collect:
		current_stage = stages[stage_index]
		
		modulate = current_stage.character_color
		
		stage_index += 1
		
		if stage_index == 4:
			_on_game_win()
			SignalControl.game_win.emit()

func _on_game_win():
	game_over = true
	var start_pos = position
	var tween = create_tween()
	tween.set_loops()
	tween.tween_property(self, "position", Vector2(start_pos.x + 5, start_pos.y), 0.5)
	tween.tween_property(self, "position", Vector2(start_pos.x - 5, start_pos.y), 0.5)

func _on_game_over():
	game_over = true
	var tween = create_tween()
	tween.tween_property(self, "position", Vector2(25, 600), 2)
