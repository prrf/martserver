extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_window().set_mouse_passthrough_polygon($Polygon2D.polygon)
	Engine.max_fps = 180
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.ismartexplodingsfx == true:
		$AudioStreamPlayer.play()
		Global.ismartexplodingsfx = false
	pass

func mart(martname : String):
	var scene = preload("res://object.tscn").instantiate()
	scene.named = martname
	$MartPoint.add_child(scene)
	pass
