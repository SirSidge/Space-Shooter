extends Area2D

@export var laser_speed := 500

func _ready():
	#$LaserImage.scale = Vector2(0, 0)
	var tween = create_tween()
	tween.tween_property($LaserImage, 'scale', Vector2(1,1), 0.1).from(Vector2(0,0))

func _process(delta):
	position += Vector2(0, -1.0) * laser_speed * delta
	
