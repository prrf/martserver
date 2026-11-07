extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("mart"):
		body.queue_free()
		$AnimatedSprite2D.play("gif")
		$AudioStreamPlayer.play()

	pass # Replace with function body.


func _on_animated_sprite_2d_animation_looped() -> void:
	$AnimatedSprite2D.stop()
	pass # Replace with function body.


func _on_showhoopcollider_body_entered(body: Node2D) -> void:
	if body.is_in_group("mart"):
		$Node2D.visible = true
	pass # Replace with function body.


func _on_showhoopcollider_body_exited(body: Node2D) -> void:
	if body.is_in_group("mart"):
		$Node2D.visible = false
	pass # Replace with function body.
