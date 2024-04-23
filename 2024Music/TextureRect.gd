extends TextureRect

var audioPlayer1: AudioStreamPlayer2D
var audioPlayer2: AudioStreamPlayer2D
var audioPlayer3: AudioStreamPlayer2D
var audioPlayer4: AudioStreamPlayer2D

func _ready():
	# Assign references to AudioStreamPlayer2D nodes
	audioPlayer1 = $AudioStreamPlayer2D
	audioPlayer2 = $AudioStreamPlayer2D2
	audioPlayer3 = $AudioStreamPlayer2D3
	audioPlayer4 = $AudioStreamPlayer2D4

func playRandomSound():
	var randomIndex = randi() % 4 + 1  # Generates a random number between 1 to 4
	match randomIndex:
		1:
			play_audio_with_random_pitch(audioPlayer1)
		2:
			play_audio_with_random_pitch(audioPlayer2)
		3:
			play_audio_with_random_pitch(audioPlayer3)
		4:
			play_audio_with_random_pitch(audioPlayer4)

# Function to play audio with randomized pitch
func play_audio_with_random_pitch(player: AudioStreamPlayer2D):
	if player:
		var randomPitch = generate_random_pitch()
		player.pitch_scale = randomPitch
		player.play()
	else:
		print("AudioStreamPlayer2D node not found or invalid.")

# Generate a random pitch value
func generate_random_pitch():
	var minPitch = 0.8
	var maxPitch = 1.2
	return randf_range(minPitch, maxPitch)

# Triggers when you click and drag
func _get_drag_data(at_position):
	var preview_texture = TextureRect.new()
	preview_texture.texture = texture
	preview_texture.expand_mode  = 1
	preview_texture.size = Vector2(30,30)
	
	var preview = Control.new()
	preview.add_child(preview_texture)
	
	set_drag_preview(preview)
	texture = null
	
	playRandomSound()  # Play random sound when starting to drag
	return preview_texture.texture

# Triggers when you hover with dragged item
func _can_drop_data(_pos, data):
	return data is Texture2D

# Triggers when you drop the dragged item
func _drop_data(_pos, data):
	texture = data
	playRandomSound()  # Play random sound when dropping the item
