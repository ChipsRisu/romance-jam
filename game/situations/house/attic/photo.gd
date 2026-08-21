extends Interaction

func on_clicked_custom() -> void:
	GameHandler.state.tags.set(Situation.Key.HOUSE_KITCHEN, "")
	GameHandler.state.tags.set(Situation.Key.HOUSE_LIVINGROOM, "photo")
	Dialogic.start("event_photo_1")
