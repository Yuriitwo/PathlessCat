extends Area2D


func _ready():
	pass


func _on_Portal_body_entered(body):
	FillTrasition.fade_in("res://Scenes/Menus/Final/Final.tscn")
