extends AudioStreamPlayer

func _ready():
	play(MusicControl.playback_position)


func _on_finished():
	if MusicControl.muted:
		return
	
	play()
