extends Timer

func _ready():
	SignalControl.change_score.connect(_on_person_hit)

func _on_person_hit(_value):
	var new_time = time_left + 3
	stop()
	set_wait_time(new_time)
	start()
