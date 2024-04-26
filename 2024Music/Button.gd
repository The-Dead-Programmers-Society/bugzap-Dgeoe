extends Button

# Declare the variable to hold a reference to AudioStreamPlayer2D
var audio_player: AudioStreamPlayer2D

func _ready():
	audio_player = $AudioStreamPlayer2D

func _on_pressed():
	# Check if its valid
	if audio_player:
		# Generate a random pitch 
		var random_pitch = generate_random_pitch()
		
		# Set the pitch 
		audio_player.pitch_scale = random_pitch
		
		# Play the audio
		audio_player.play()
	else:
		print("AudioStreamPlayer2D node not found or invalid.")

# pitch generator functon
func generate_random_pitch():
	var min_pitch = 0.8
	var max_pitch = 1.2
	
	return randf_range(min_pitch, max_pitch)
