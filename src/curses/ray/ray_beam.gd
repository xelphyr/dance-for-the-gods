extends StaticBody2D

@onready var collide : CollisionShape2D = $Collision
@onready var sprite : Sprite2D = $Sprite
@onready var delay_timer : Timer = $DelayTimer

@export var delay : float
@export var duration : float

var is_firing := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_setup()
	_charge_up()

func _process(_delta: float) -> void:
	if !delay_timer.is_stopped():
		sprite.modulate.a = (delay - delay_timer.time_left)/(delay*2)

func _setup():
	sprite.modulate.a = 0
	collide.disabled = true

func _charge_up() -> void:
	delay_timer.start(delay)


func _on_delay_timeout() -> void:
	sprite.modulate.a = 1
	collide.disabled = false
	await get_tree().create_timer(duration).timeout
	queue_free()
