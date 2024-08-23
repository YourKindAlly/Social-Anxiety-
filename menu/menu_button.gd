class_name InMenuButton extends Control

@export var button_display : Label
@export var button_text : String

func _ready():
	button_display.text = button_text

func _on_button_down():
	button_display.position.y += 5

func _on_button_up():
	button_display.position.y -= 5

