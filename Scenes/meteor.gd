extends Area2D

var meteor_speed: int
var meteor_direction_x: float
var meteor_rotation: int
var meteor_graphic := ["res://PNG/Meteors/meteorBrown_big1.png", 
"res://PNG/Meteors/meteorBrown_big2.png", 
"res://PNG/Meteors/meteorBrown_big3.png",
"res://PNG/Meteors/meteorBrown_big4.png",
"res://PNG/Meteors/meteorGrey_big1.png",
"res://PNG/Meteors/meteorGrey_big2.png", 
"res://PNG/Meteors/meteorGrey_big3.png", 
"res://PNG/Meteors/meteorGrey_big4.png"]

signal collision

func _ready():
	var rng := RandomNumberGenerator.new()
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-150, -50)
	position = Vector2(random_x, random_y)
	
	var random_image := rng.randi_range(0, len(meteor_graphic) - 1)
	$MeteorImage.texture = load(meteor_graphic[random_image])
	
	meteor_speed = rng.randi_range(100, 200)
	meteor_direction_x = rng.randf_range(-1.0, 1.0)
	meteor_rotation = rng.randi_range(-120, 120)
	
func _process(delta):
	position += Vector2(meteor_direction_x, 1.0) * meteor_speed * delta
	rotation_degrees += meteor_rotation * delta

func _on_body_entered(_body):
	collision.emit()

func _on_area_entered(area):
	area.queue_free()
	Global.score += 1
	$ExplodeSound.play()
	$MeteorImage.hide()
	$CollisionShape2D.set_deferred("disabled", true)
	await get_tree().create_timer(1).timeout
	queue_free()
