extends InMenuButton

@export var pause_node : Control

func _on_button_pressed():
	get_tree().paused = false
	pause_node.position = Vector2(-570, 460)
