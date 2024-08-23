extends TextureProgressBar

@export var game_timer : Timer
@export var time_until_gray : Timer

@export var gray_bar : Texture
var game_over : bool

func _ready():
	SignalControl.game_win.connect(_on_game_win)
	SignalControl.socializing.connect(_on_socializing)
	max_value = game_timer.wait_time

func _process(_delta):
	if game_over:
		return
	
	value = game_timer.time_left

func _on_socializing():
	time_until_gray.start()

func _on_timer_timeout():
	texture_progress = gray_bar

func _on_game_win():
	game_over = true
