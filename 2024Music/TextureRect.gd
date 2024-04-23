extends TextureRect

func playRandomSound():
	var audioPlayer1 = $AudioStreamPlayer2D
	var audioPlayer2 = $AudioStreamPlayer2D2
	var audioPlayer3 = $AudioStreamPlayer2D3
	var audioPlayer4 = $AudioStreamPlayer2D4
	
	var randomIndex = randi() % 4 + 1  # Generates a random number between 1 to 4
	match randomIndex:
		1:
			audioPlayer1.play()
		2:
			audioPlayer2.play()
		3:
			audioPlayer3.play()
		4:
			audioPlayer4.play()

#triggers when you click and drag
func _get_drag_data(at_position):
	
	var preview_texture = TextureRect.new()
	
	preview_texture.texture = texture
	preview_texture.expand_mode  = 1
	preview_texture.size = Vector2(30,30)
	
	var preview = Control.new()
	preview.add_child(preview_texture)
	
	set_drag_preview(preview)
	texture = null
	
	return preview_texture.texture
	#play random sound
	playRandomSound()

#triggers when you hover with dragged item
func _can_drop_data(_pos, data):
	return data is Texture2D

#triggers when you drop that dragged item
func _drop_data(_pos, data):
	texture = data
	playRandomSound()
	
