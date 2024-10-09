extends Control

var level_scene: PackedScene = load("res://Scenes/level.tscn")

func _ready():
	$CenterContainer/VBoxContainer/Label2.text = "Score: " + str(Global.score)
	$EndGameSound.play()


func _input(event):
	if event.is_action_pressed("shoot"):
		Global.score = 0
		get_tree().change_scene_to_packed(level_scene)
		
