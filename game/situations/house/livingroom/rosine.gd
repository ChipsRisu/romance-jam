extends Interaction

func on_clicked_custom() -> void:
	GameHandler.state.tags.set(Situation.Key.HOUSE_ENTRANCE, "both")
