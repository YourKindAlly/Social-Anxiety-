extends CanvasModulate

func _ready():
	var tween = create_tween()
	tween.set_loops()
	tween.tween_property(self, "color", Color.LIGHT_SKY_BLUE, 5)
	tween.tween_property(self, "color", Color.LIGHT_PINK, 5)
	tween.tween_property(self, "color", Color.LIGHT_YELLOW, 5)
