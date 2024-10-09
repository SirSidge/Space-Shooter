extends CharacterBody2D

@export var speed := 400

var can_shoot = true

signal laser(pos)

# Called when the node enters the scene tree for the first time.
#func _ready():
	#position = Vector2(200, 200)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * speed
	move_and_slide()
	
	if Input.is_action_just_pressed("shoot") and can_shoot:
		laser.emit($LaserStartPos.global_position)
		can_shoot = false
		$LaserCooldown.start()
		$LaserSound.play()
		
func _on_laser_cooldown_timeout():
	can_shoot = true
	
func _play_collision_sound():
	$TakeDamge.play()
