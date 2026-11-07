extends RigidBody2D
@export var MitosisEnabled : bool
@onready var nametag = $Label
var evil = false
var named = "mart"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.position = Vector2(randi_range(1,1920),540)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var random = randi_range(1,1000)
	var mitosis = randi_range(1,10000)
	nametag.text = named

	if random == 1000 and collides() == true:
		var height = randi_range(-50000, -10000)
		var sideforce = randi_range(-25000, 25000)
		self.apply_force(Vector2(sideforce,height),Vector2(0,0))
		print("applied force. Height: " + str(height) + " Side: " + str(sideforce))
	if mitosis == 10000 and MitosisEnabled:
		mitosis("")
	if Global.ismartexploding == true:
		explode()


func collides():
	for i in get_colliding_bodies():
		if i.is_in_group("Floor"):
			return true
			print("true")
		else: return false

func mitosis(namestring : String):
	var copy = duplicate()
	get_parent().add_child(copy)
	copy.named = namestring
	print("mitosis")

func isevil():
	print("ran")
	var scaley1 = randf_range(0.4,1)
	var scaley2 = randf_range(0.4,1)
	var scaley = Vector2(scaley1, scaley2)
	print(scaley)
	var scaleybox = Vector2(scaley2, scaley1)
	print(scaleybox)
	$mart.scale = scaley
	$evilmart.scale = scaley * Vector2(0.647, 0.647)
	$CollisionShape2D.scale = scaleybox
	if $Label.text.to_lower().contains("/kill @a"):
		for i in get_parent().get_children():
			Global.ismartexploding = true
	if $Label.text.to_lower().contains("evil"):
		evil = true
	if $Label.text.to_lower().contains("mart"):
		$mart.scale = Vector2(1.5,1.5)
		$evilmart.scale = Vector2(1.5 * 0.647,1.5 * 0.647)
		$CollisionShape2D.scale = Vector2(1.5,1.5)
	if evil == true:
		print("evil")
		$mart.visible = false
		$evilmart.visible = true
		$evilmart.play("gif")
	elif evil == false:
		print("not evil")
		$mart.visible = true
		$evilmart.visible = false
		$mart.play("gif")


func _on_timer_timeout() -> void:
	isevil()
	pass # Replace with function body.

func explode():
	$AnimatedSprite2D.visible = true
	$AnimatedSprite2D.play("gif")

func _on_animated_sprite_2d_animation_looped() -> void:
	Global.ismartexploding = false
	self.queue_free()
	pass # Replace with function body.
