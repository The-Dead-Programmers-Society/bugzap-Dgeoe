extends RigidBody2D

var dragging = false
var originalOffset = Vector2(0, 0)

# Declare variables to hold references to AudioStreamPlayer2D nodes
var audioPlayer1: AudioStreamPlayer2D
var audioPlayer2: AudioStreamPlayer2D

func _ready():
	audioPlayer1 = $AudioStreamPlayer2D
	audioPlayer2 = $AudioStreamPlayer2D2

func _process(delta):
	if dragging:
		position = get_global_mouse_position() - originalOffset

func _on_button_button_down():
	dragging = true
	originalOffset = get_global_mouse_position() - global_position
	
	if audioPlayer1:
		play_audio_with_random_pitch(audioPlayer1)

func _on_button_button_up():
	dragging = false
	
	if audioPlayer2:
		play_audio_with_random_pitch(audioPlayer2)

# play audio with randomized pitch
func play_audio_with_random_pitch(player: AudioStreamPlayer2D):
	if player:
		var randomPitch = generate_random_pitch()
		player.pitch_scale = randomPitch
		player.play()
	else:
		print("AudioStreamPlayer2D node not found or invalid.")

# pitch randomizer
func generate_random_pitch():
	var minPitch = 0.8
	var maxPitch = 1.2
	return randf_range(minPitch, maxPitch)
