extends ParallaxBackground

var scrolling_speed: int = 180

func _process(delta: float) -> void:
	if Globals.game_running:
		scroll_offset.x -= scrolling_speed * delta


func _on_area_2d_body_entered(body: Player) -> void:
	if Globals.game_running:
		SignalBus.running.emit()


func _on_area_2d_body_exited(body: Player) -> void:
	if Globals.game_running:
		SignalBus.flying.emit()
