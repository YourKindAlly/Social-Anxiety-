extends Node

signal scene_change(audio_playback : float)

var playback_position : float
var muted : bool

func _ready():
	scene_change.connect(_on_scene_change)

func _on_scene_change(audio_playback):
	playback_position = audio_playback
