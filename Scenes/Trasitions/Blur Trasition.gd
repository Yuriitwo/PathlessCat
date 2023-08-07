extends CanvasLayer

signal start_game

onready var animation = get_node("Blur/AnimationPlayer")

var target_level: String

func fade_in(level: String) -> void:
	target_level = level
	animation.play("Trasition_In")


func on_animation_finished(anim_name):
	if anim_name == "Trasition_In":
		var _change_level = get_tree().change_scene(target_level)
		animation.play("Trasition_Out")
	elif anim_name == "Trasition_Out":
		emit_signal("start_game")
