extends Node2D


var SPAWN_POINT := 3500

@onready var spawn_timer := $SpawnTimer

var rng := RandomNumberGenerator.new()
@export var obstacles: Array[PackedScene]
var weights := PackedFloat32Array([2, 2, 1])
	

func spawn_obstacle() -> void:
	if Globals.game_running:
		var random_obstacle = obstacles[rng.rand_weighted(weights)]
		var obstacle = random_obstacle.instantiate()
		obstacle.position.x = SPAWN_POINT
		add_child(obstacle)
		
		if obstacle.has_signal("finished"):
			obstacle.finished.connect(_on_obstacle_finished)
			
		elif "spawn_delay" in obstacle:
			spawn_timer.start(obstacle.spawn_delay)
			
		else:
			spawn_timer.start(3.0)
	


func _on_spawn_timer_timeout() -> void:
	spawn_obstacle()



func _on_obstacle_finished() -> void:
	spawn_obstacle()
