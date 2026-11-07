extends CharacterBody2D


func _process(delta: float) -> void:
	var cursorpos = get_global_mouse_position()
	#var cursorpos = DisplayServer.mouse_get_position()
	self.position = Vector2(cursorpos)
