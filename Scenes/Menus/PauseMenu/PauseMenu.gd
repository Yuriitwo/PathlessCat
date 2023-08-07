extends Control

var original_modulate_color
var a = -1

func _process(delta):
	
	if Input.is_action_just_pressed("ui_esc"):
		a *= -1
		
	if a == 1:
		show()
		$Sprite/AnimationPlayer.play("PauseMenuGradient")
		$Button.visible = true
		#get_tree().paused = true
		
	if a == -1:
		hide()
		$Sprite/AnimationPlayer.stop()
		$Button.visible = false
		#get_tree().paused = false
