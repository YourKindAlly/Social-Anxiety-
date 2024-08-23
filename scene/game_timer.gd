extends Timer

var is_in_light := false
@export var reduced_time : float

@export var red_bar : Texture
@export var green_bar : Texture
@export var gray_bar : Texture

@export var timer_bar : TextureProgressBar

func _ready():
	SignalControl.light_entered.connect(_on_light_entered)
	SignalControl.light_exited.connect(_on_light_exited)
	SignalControl.socializing.connect(_on_socialize)

func _process(delta):
	if time_left <= 0.5:
		return
	
	if is_in_light:
		var time = time_left
		stop()
		wait_time = time - reduced_time * delta
		start()

func _on_light_entered():
	is_in_light = true
	timer_bar.texture_progress = red_bar

func _on_light_exited():
	timer_bar.texture_progress = gray_bar
	is_in_light = false

func _on_socialize():
	var time = time_left
	stop()
	timer_bar.texture_progress = green_bar
	wait_time = time + 1
	start()
