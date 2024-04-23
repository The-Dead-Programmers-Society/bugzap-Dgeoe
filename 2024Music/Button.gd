extends Button

# Declare the variable to hold a reference to AudioStreamPlayer2D
var audio_player: AudioStreamPlayer2D

func _ready():
	# Assign the AudioStreamPlayer2D node to the variable
	audio_player = $AudioStreamPlayer2D

func _on_pressed():
	# Check if the audio player node exists and is valid
	if audio_player:
		# Generate a random pitch value
		var random_pitch = generate_random_pitch()
		
		# Set the pitch of the audio player
		audio_player.pitch_scale = random_pitch
		
		# Play the audio
		audio_player.play()
	else:
		print("AudioStreamPlayer2D node not found or invalid.")

# Generate a random pitch value
func generate_random_pitch():
	var min_pitch = 0.8
	var max_pitch = 1.2
	
	return randf_range(min_pitch, max_pitch)
