extends Node2D

@onready var bg_music := $BackgroundMusic
@onready var go_music := $GameOverMusic

func _ready() -> void:
	bg_music.play()
	SignalBus.game_over.connect(game_over)


func _process(delta: float) -> void:
	pass
	
	
func game_over() -> void:
	bg_music.stop()
	go_music.play()
	await get_tree().create_timer(7.0).timeout
	get_tree().change_scene_to_packed(Globals.menu_scene)
	
