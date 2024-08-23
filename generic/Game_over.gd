extends Label

var game_over : bool
var game_win : bool

func _ready():
	SignalControl.game_win.connect(_on_game_win)

func _on_game_timeout():
	if game_win:
		return
	
	game_over = true
	text = "Game over!"
	visible = true
	SignalControl.game_over.emit()

func _on_game_win():
	if game_over:
		return
	
	game_win = true
	text = "You win!"
	visible = true
