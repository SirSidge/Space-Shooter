extends CanvasLayer

static var image = load("res://PNG/playerShip1_red.png")

func set_health(amount):
	# remove all children from hboxcontainer
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()
	
	# create new children amount is set by health
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = image
		$MarginContainer2/HBoxContainer.add_child(text_rect)
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP
		text_rect.stretch_mode = TextureRect.STRETCH_SCALE


func _on_score_timer_timeout():
	Global.score += 1
	$MarginContainer/Label.text = "Score: " + str(Global.score)
