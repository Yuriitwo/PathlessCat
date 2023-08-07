extends Area2D

var player_ref

func _on_body_entered(body):
	if body.is_in_group("Player"):
		player_ref = body

func _on_body_exited(body):
	if body.is_in_group("Player"):
		player_ref = null

func _process(_delta) -> void:
	if Input.is_action_just_pressed("ui_accept") and player_ref != null:
		if player_ref.key == true:
			$AnimatedSprite.play("aberto")
			$TileMap.queue_free()
			player_ref.key = false
