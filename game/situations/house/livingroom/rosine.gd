extends Interaction

func on_clicked_custom() -> void:
	GameHandler.setTag(Situation.Key.HOUSE_ENTRANCE, "both")
