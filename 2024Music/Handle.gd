extends RigidBody2D

var dragging = false
var of = Vector2(0,0)

#called every frame
func _process(delta):
	if dragging:
		position = get_global_mouse_position() -  of
		
func _on_button_button_down():
	dragging =  true 
	of = get_global_mouse_position()- global_position
	$AudioStreamPlayer2D.play()


func _on_button_button_up():
	dragging = false
	$AudioStreamPlayer2D2.play()
