extends TextureRect

func _ready():
	var tween = create_tween()
	tween.set_parallel(false)
	tween.set_loops()
	tween.tween_property(self, "position", Vector2(-1400, -100), 10)
	tween.tween_property(self, "position", Vector2(0, -100), 10)
