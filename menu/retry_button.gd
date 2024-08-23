extends InMenuButton

@export var audio : AudioStreamPlayer

func _ready():
	visible = false
	SignalControl.game_over.connect(_on_game_over)
	SignalControl.game_win.connect(_on_game_win)

func _on_game_over():
	button_display.text = "Try again?"
	visible = true

func _on_game_win():
	button_display.text = "Another go?"
	visible = true

func _on_button_pressed():
	MusicControl.scene_change.emit(audio.get_playback_position())
	get_tree().change_scene_to_file("res://scene/main_scene.tscn")
