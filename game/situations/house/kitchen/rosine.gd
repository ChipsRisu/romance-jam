extends Interaction

const TAG = "attic"

func on_clicked_custom() -> void:
	var hasPlumeau = GameHandler.state.inventory.get("plumeau")
	
	if hasPlumeau == null || hasPlumeau == false:
		GameHandler.setTag(Situation.Key.HOUSE_ENTRANCE, TAG)
		GameHandler.setTag(Situation.Key.HOUSE_ATTIC, "sale")
		GameHandler.state.inventory.set("plumeau", true)
