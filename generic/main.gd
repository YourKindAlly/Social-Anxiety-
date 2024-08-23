extends Node2D

@export_file var person_scene_path : String

@export var spawner_node : Node2D

@export var person_limit : int

@export var growth_duration : float

@export var audio : AudioStreamPlayer

@export var pause_menu : Control

var game_over : bool

@export var debug_game_win : bool

func _ready():
	SignalControl.game_over.connect(_on_game_over)
	if MusicControl.muted:
		return
	audio.play(MusicControl.playback_position)

func _unhandled_input(event):
	if game_over:
		return
	
	if event.is_action_pressed("pause_game"):
		if pause_menu.position != Vector2(-570, -300):
			pause_menu.position = Vector2(-570, -300)
			get_tree().paused = true
		else:
			get_tree().paused = false
			pause_menu.position = Vector2(-570, 460)

func _on_spawn_timer_timeout():
	if len(spawner_node.get_children()) > person_limit:
		spawner_node.get_child(0).queue_free()
	
	var person_scene = load(person_scene_path)
	var person = person_scene.instantiate()
	
	spawner_node.add_child(person)
	
	var tween = create_tween()
	tween.tween_property(person, "scale", Vector2(1, 1), growth_duration)

func _on_audio_finished():
	if MusicControl.muted:
		return
	
	audio.play()

func _on_game_over():
	game_over = true
