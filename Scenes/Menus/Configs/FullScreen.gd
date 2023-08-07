extends CheckButton

func _ready():
	pass

func _on_FullScreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
