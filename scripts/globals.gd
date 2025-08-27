extends Node

var game_running := false

var menu_scene := preload("res://scenes/main_menu.tscn")
var game_scene: PackedScene = preload("res://scenes/main.tscn")
var save_path := "user://high_score.tres"
var high_score := 0

const HighScoreResource = preload("res://scripts/high_score.gd")


func load_high_score():
	if ResourceLoader.exists(save_path):
		var high_score_instance = ResourceLoader.load(save_path, "HighScore")
		if high_score_instance.high_score:
			high_score = high_score_instance.high_score
	return high_score


func save_high_score(score):
	var new_high_score: HighScore = HighScoreResource.new()
	new_high_score.high_score = score
	ResourceSaver.save(new_high_score, save_path)
