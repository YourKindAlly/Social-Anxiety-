extends InMenuButton

@export_file var scene_path

@export var audio : AudioStreamPlayer

func _on_button_pressed():
	MusicControl.scene_change.emit(audio.get_playback_position())
	get_tree().paused = false
	get_tree().change_scene_to_file(scene_path)
