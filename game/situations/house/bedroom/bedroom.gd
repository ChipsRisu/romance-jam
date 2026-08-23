extends Situation

const TAG: String = "FIRST_DAY_START"
const EXPECTED_COUNT = 3

func _process(_delta: float) -> void:
	if countCheckedChildren() >= EXPECTED_COUNT:
		GameHandler.setActiveTag(TAG)
		SituationHandler.hideHud(false)
		Dialogic.VAR.set_variable("util.isRoomChecked", true)
		GameHandler.setTag(Situation.Key.HOUSE_KITCHEN, "morning")
	elif !isDoorOpen():
		SituationHandler.hideHud(true)

func updateUi(isMoving: bool) -> void:
	if isDoorOpen():
		super.updateUi(isMoving)

func countCheckedChildren() -> int:
	var count = 0
	for interaction: Interaction in interactions.get_children():
		if interaction.checked: count+= 1
	return count

func isDoorOpen() -> bool:
	var isDone = Dialogic.VAR.get_variable("util.isRoomDone")
	return isDone || TAG == self.tag || Situation.Day.MON != GameHandler.state.day
