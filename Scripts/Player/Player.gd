extends KinematicBody2D

export var speed = 300
export var jump_speed = -300
export var gravity = 10

var key: bool = false
var motion = Vector2.ZERO

func _process(_delta):
	if is_on_floor():
		if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
			$AnimatedSprite.play("run")
		else:
			$AnimatedSprite.play("idle")
			
		if Input.is_action_just_pressed("ui_up"):
			motion.y = jump_speed
			
		if Input.is_action_pressed("ui_down"):
			$AnimatedSprite.play("sleep")
	else:
		motion.y += gravity
		
		if motion.y > 0:
			$AnimatedSprite.play("fall")
		else:
			$AnimatedSprite.play("jump")
		
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
		$AnimatedSprite.flip_h = true
	else:
		motion.x = 0

	move_and_slide(motion, Vector2.UP)
