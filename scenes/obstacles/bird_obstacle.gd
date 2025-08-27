extends Area2D

@onready var flying_animation := $AnimatedSprite2D
@onready var sound := $Sound


func _ready() -> void:
	flying_animation.play()
	sound.play()


func _on_body_entered(body: Player) -> void:
	if Globals.game_running:
		SignalBus.game_over.emit()
