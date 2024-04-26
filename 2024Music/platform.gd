#old drag and drop method not using tweening
#found on youtube at https://www.youtube.com/watch?v=uhgswVkYp0o&ab_channel=Dicode
#broke other elements of my instrument so I tried to write my own
#mine is not as smooth visually as the original but works significantly better with audio 
extends StaticBody2D

func _ready():
	modulate = Color(Color.MEDIUM_PURPLE, 0.7)

func _process(delta):
	if global.is_dragging:
		visible = true
	else:
		visible = false
