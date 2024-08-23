extends Control

@export var transition_time := 1.5

func _on_tutorial_button_pressed():
	var tween = create_tween()
	tween.tween_property(self, "position", Vector2(1152, 0), transition_time)

func _on_credits_button_pressed():
	var tween = create_tween()
	tween.tween_property(self, "position", Vector2(-1152, 0), transition_time)

func _on_tutorial_back_button_pressed():
	var tween = create_tween()
	tween.tween_property(self, "position", Vector2(0, 0), transition_time)

func _on_credits_back_button_pressed():
	var tween = create_tween()
	tween.tween_property(self, "position", Vector2(0, 0), transition_time)
