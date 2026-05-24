extends Node2D

@onready var spawn_timer : Timer = $SpawnTimer

@export var ray_scene : PackedScene

@export var spawn_rate : float
@export var ray_delay : float
@export var ray_duration : float

func _ready() -> void:
	spawn_timer.start(spawn_rate)

func _on_spawn_timer_timeout() -> void:
	var ray = ray_scene.instantiate()

	ray.position = Vector2(randf_range(100, 1000), randf_range(100, 550))
	ray.rotation = randf()*PI

	ray.delay = ray_delay
	ray.duration = ray_duration

	call_deferred("add_child", ray)
