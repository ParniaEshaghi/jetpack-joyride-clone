extends Control


@onready var score := $ScoreLabel
@onready var game_over_message := $GameOverLabel
@onready var high_score_label := $HighScoreLabel

var speed := 100
var distance: int = 0


func _ready() -> void:
	game_over_message.hide()
	SignalBus.game_over.connect(game_over)
	var high_score = str(Globals.load_high_score())
	high_score_label.text = ("High Score : " + high_score)


func _process(delta: float) -> void:
	if Globals.game_running:
		distance += speed * delta
		score.text = str(distance)


func game_over() -> void:
	if distance > Globals.high_score:
		Globals.save_high_score(distance)
	game_over_message.show()
