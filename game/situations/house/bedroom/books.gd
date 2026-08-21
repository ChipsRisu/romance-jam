extends Interaction

const KEY = "util.booksClickedCounter"

func on_clicked_custom() -> void:
	var clickedCount = Dialogic.VAR.get_variable(KEY)
	var next: int = clickedCount + 1 if clickedCount != null else 1
	Dialogic.VAR.set_variable(KEY, next)
