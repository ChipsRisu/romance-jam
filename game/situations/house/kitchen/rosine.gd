extends Interaction

const TAG = "attic"

func on_clicked_custom() -> void:
	var hasPlumeau = GameHandler.state.inventory.get("plumeau")
	
	if hasPlumeau == null || hasPlumeau == false:
		GameHandler.state.tags.set(Situation.Key.HOUSE_ENTRANCE, TAG)
		GameHandler.state.inventory.set("plumeau", true)
