extends Area2D

@onready var sprite := $Sprite2D
@export var ship_sprites: Array[Texture2D]
@onready var sound := $Sound

var spawn_delay := 3.0
var speed := 1000
var deleting_position_x := -100


func _ready() -> void:
	sprite.texture = ship_sprites.pick_random()
	position.y = randf_range(200, 850) 
	sound.play()


func _process(delta: float) -> void:
	position.x -= speed * delta
	if position.x < deleting_position_x:
		queue_free()
		
		
func _on_body_entered(body: Player) -> void:
	if Globals.game_running:
		SignalBus.game_over.emit()
