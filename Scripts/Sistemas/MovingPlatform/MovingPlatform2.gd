extends Node2D

onready var platform = $platform
onready var tween = $Tween

export var speed = 3.0
export var horizontal = true
export var distance = 380

var follow = Vector2.ZERO

const WAIT_DURATIN = 1.0

func _ready():
	_start_tween()

func _start_tween():
	var move_direction = Vector2.RIGHT * distance if horizontal else Vector2.UP * distance
	var duration = move_direction.length() / float(speed * 16)
	tween.interpolate_property(
		self, "follow", Vector2.ZERO, move_direction, duration,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, WAIT_DURATIN
	)
	tween.interpolate_property(
		self, "follow", move_direction, Vector2.ZERO, duration,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT, duration + WAIT_DURATIN * 2
	)
	tween.start()

func _physics_process(delta: float) -> void:
	platform.position = platform.position.linear_interpolate(follow, 0.05)
