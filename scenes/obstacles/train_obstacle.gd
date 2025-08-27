extends Area2D

signal finished

@onready var horn_sound := $HornSound
@onready var rail_sound := $RailSound

var speed := 700
var deleting_position_x := -7500

func _ready() -> void:
	position.y = 750
	horn_sound.play()

func _process(delta: float) -> void:
	position.x -= speed * delta
	if position.x < deleting_position_x:
		finished.emit()
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	rail_sound.play()


func _on_body_entered(body: Player) -> void:
	if Globals.game_running:
		SignalBus.game_over.emit()
