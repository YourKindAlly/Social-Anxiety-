extends VBoxContainer

func _ready():
	visible = false

func _on_view_timeout():
	visible = true
