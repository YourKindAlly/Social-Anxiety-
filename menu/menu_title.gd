extends Label

func _ready():
	var tween_position = create_tween()
	var tween_scale = create_tween()
	tween_scale.set_trans(Tween.TRANS_BOUNCE)
	tween_scale.set_loops()
	tween_scale.tween_property(self, "scale", Vector2(1.1, 1.1), 0.5)
	tween_scale.tween_property(self, "scale", Vector2(1, 1), 0.5)
	tween_position.tween_property(self, "position", Vector2(0, 100), 3)
