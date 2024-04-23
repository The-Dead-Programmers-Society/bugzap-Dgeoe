extends Sprite2D

var is_dragging = false
var pivot_point : Node2D

func _ready():
	# Connect mouse input signals
	set_process_input(true)
	pivot_point = get_parent()

func _input(event):
	if event is InputEventMouseButton:
		var mouse_event = event as InputEventMouseButton
		if mouse_event.button_index == MOUSE_BUTTON_LEFT:
			if mouse_event.pressed:
				var local_pos = global_transform.origin - pivot_point.global_transform.origin
				var distance = local_pos.length()
				if distance < 40:  # Set a threshold for clicking within a radius
					is_dragging = true
			elif mouse_event.button_index == MOUSE_BUTTON_LEFT and mouse_event.pressed == false:
				is_dragging = false

	if is_dragging:
		# Get mouse position and calculate angle
		var global_mouse_pos = get_global_mouse_position()
		var crank_angle = (global_mouse_pos - pivot_point.global_position).angle()
		pivot_point.rotation_degrees = crank_angle
