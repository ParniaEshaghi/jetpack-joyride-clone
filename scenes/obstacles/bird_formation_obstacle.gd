extends Node2D

@onready var bird_scene: PackedScene = preload("res://scenes/obstacles/bird_obstacle.tscn")
var count: int = 5
var spacing: float = 100
var spin_speed: float = 2

var spawn_delay := 5.0
var speed := 400
var deleting_position_x := -1000

var formation_types := ["line", "v", "circle", "wave"]
var formation_type: String

func _ready():
	formation_type = formation_types.pick_random()
	position.y = randf_range(200, 800) 
	match formation_type:
		"line":
			for i in range(count):
				spawn_bird(Vector2(i * spacing * 1.2, 0))

		"v":
			for i in range(count - 2):
				spawn_bird(Vector2(i * spacing,  i * spacing))
				spawn_bird(Vector2(i * spacing, -i * spacing))

		"circle":
			for i in range(count):
				var angle = i * (TAU / count)
				var pos = Vector2(cos(angle), sin(angle)) * spacing/2 * count/2
				spawn_bird(pos)


func spawn_bird(offset: Vector2):
	var bird = bird_scene.instantiate()
	bird.position = offset
	add_child(bird)

func _process(delta):
	position.x -= speed * delta
	if position.x < deleting_position_x:
		queue_free()
