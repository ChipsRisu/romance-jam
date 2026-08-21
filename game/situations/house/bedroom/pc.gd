extends Interaction

const KEY = "dialogue.favStreamer"
const STREAMERS = [
	"twitch.tv/aconit_shichika",
	"twitch.tv/chipsrisu",
	"twitch.tv/lumiole",
	"twitch.tv/meika_amethyst",
	"twitch.tv/mevennuss",
	"twitch.tv/plumeep",
	"twitch.tv/vulcainos",
	"twitch.tv/yagacapy"
]

func on_clicked_custom() -> void:
	var randomIndex = randi() % STREAMERS.size()
	Dialogic.VAR.set_variable(KEY, STREAMERS[randomIndex])
