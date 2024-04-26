extends RigidBody2D

const FORCE_AMOUNT = 202200  # Force applied

var soundPlayer: AudioStreamPlayer2D

func _ready():
	soundPlayer = $AudioStreamPlayer2D  

#Crank swing movemnt on pinjoint 2D 
func _process(delta):
	if Input.is_action_pressed("move_right"):
		apply_force(Vector2.LEFT * FORCE_AMOUNT, Vector2.ZERO)
		play_sound_effect()
	elif Input.is_action_pressed("move_left"):
		apply_force(Vector2.RIGHT * FORCE_AMOUNT, Vector2.ZERO)
		play_sound_effect()

func play_sound_effect():
	if soundPlayer:
		# Generate a random pitch value
		var randomPitch = generate_random_pitch()
		
		# Set the pitch of the audio player
		soundPlayer.pitch_scale = randomPitch
		
		soundPlayer.play()

# Generate a random pitch value
func generate_random_pitch():
	var minPitch = 0.8
	var maxPitch = 1.2
	return randf_range(minPitch, maxPitch)

