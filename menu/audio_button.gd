extends TextureButton

@export var audio : AudioStreamPlayer

func _ready():
	if MusicControl.muted:
		button_pressed = true

func _on_toggled(toggled_on):
	if toggled_on:
		MusicControl.playback_position = audio.get_playback_position()
		MusicControl.muted = true
		audio.stop()
	else:
		MusicControl.muted = true
		audio.play(MusicControl.playback_position)
