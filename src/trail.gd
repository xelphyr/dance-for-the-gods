extends Line2D


@export var follow : Node2D

@export var seconds_per_point : float = 0.2
@export var max_points : int = 10

var timer_on : bool
@onready var countdown : float = seconds_per_point

@export var enabled : bool:
	set(val):
		enabled = val
		if !is_node_ready() : await ready
		if val:
			_enable()
		else:
			_disable()

func _process(delta: float) -> void:
	if timer_on:
		countdown -= delta
		if countdown < delta:
			countdown += seconds_per_point
			_point_logic()

func _enable():
	timer_on = true

func _disable():
	timer_on = false
	clear_points()

func _point_logic() -> void:
	add_point(follow.global_position)
	if points.size() > max_points:
		remove_point(0)
