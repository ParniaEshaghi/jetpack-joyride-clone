extends Control

@onready var mm_music := $MainMenuMusic


func _ready() -> void:
	mm_music.play()


func _on_start_button_pressed() -> void:
	Globals.game_running = true
	get_tree().change_scene_to_packed(Globals.game_scene)


func _on_exit_button_pressed() -> void:
	get_tree().quit()
	
