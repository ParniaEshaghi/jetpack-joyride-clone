extends RigidBody2D
class_name Player

@onready var anim := $AnimatedSprite2D

@onready var flying_col := $FlyingCollisionShape
@onready var running_col := $RunningCollisionShape

func _ready() -> void:
	anim.play("flying")
	SignalBus.running.connect(running)
	SignalBus.flying.connect(flying)
	SignalBus.game_over.connect(dying)
	
	
func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	self.apply_central_force(Vector2.ZERO)
	
	
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("accelerate") and Globals.game_running:
		accelerate()


func running() -> void:
	anim.play("running")
	flying_col.disabled = true
	running_col.disabled = false


func flying() -> void:
	anim.play("flying")
	flying_col.disabled = false
	running_col.disabled = true
	
	
func accelerate() -> void:
	self.apply_central_impulse(Vector2(0, -100))


func dying() -> void:
	anim.play("dying", 0.5)
	Globals.game_running = false
