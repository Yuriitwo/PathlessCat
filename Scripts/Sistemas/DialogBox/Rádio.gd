extends Area2D

var can_interact = false


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		$Label.visible = true
		can_interact = true

func _on_Area2D_body_exited(body):
	if body.name == "Player":
		$Label.visible = false
		$Box.visible = false
		$RichTextLabel.visible = false
		can_interact = false

func _input(event):
	if Input.is_key_pressed(KEY_E) and can_interact == true:
		$Label.visible = false
		$Box.visible = true
		$RichTextLabel.visible = true
		$RichTextLabel/AnimationPlayer.play("LabelBox")
