extends Interaction

func on_clicked_custom() -> void:
	GameHandler.setTag(Situation.Key.HOUSE_KITCHEN, "")
	GameHandler.setTag(Situation.Key.HOUSE_LIVINGROOM, "photo")
	Dialogic.start("event_photo_1")
