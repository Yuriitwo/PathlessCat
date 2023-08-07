extends Button

var original_modulate_color

func _ready():
	original_modulate_color = modulate

func _on_start_pressed():
	FillTrasition.fade_in("res://Scenes/Rooms/HouseCat.tscn")
	
func _on_start_mouse_entered():
	$Tween.interpolate_property(self, "modulate", original_modulate_color, Color(0.5, 0.7, 1), 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()

func _on_start_mouse_exited():
	$Tween.interpolate_property(self, "modulate", modulate, original_modulate_color, 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$Tween.start()
