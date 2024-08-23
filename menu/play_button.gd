extends InMenuButton

@export_file var game_path

@export var audio : AudioStreamPlayer

func _on_button_pressed():
	MusicControl.scene_change.emit(audio.get_playback_position())
	get_tree().change_scene_to_file(game_path)
