extends Area2D

func _on_body_entered(body):
	if body is Player:
		SignalControl.light_entered.emit()

func _on_body_exited(body):
	if body is Player:
		SignalControl.light_exited.emit()
