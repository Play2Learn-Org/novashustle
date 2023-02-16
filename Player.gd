extends KinematicBody2D

var tilesize = 64

onready var ray = $RayCast2D

var inputs = {
	'ui_up' : Vector2.UP,
	'ui_down' : Vector2.DOWN,
	'ui_left' : Vector2.LEFT,
	'ui_right' : Vector2.RIGHT,
}


func _unhandled_input(event):
	for direction in inputs.keys():
		if event.is_action_pressed(direction):
			move(inputs[direction] * tilesize) # Not inputs(direction)?

func move(direction):
	print("move", direction)
	ray.cast_to = direction
	ray.force_raycast_update()
	# return on branches when the player object shouldn't move
	if ray.is_colliding():
		var collider = ray.get_collider()
		print("collided with", collider)
		if collider.is_in_group('movable'):
			if !collider.move(direction):
				return
		elif collider.is_in_group('notification'):
			print("send event info_discovered with topic and name: ", collider.get("topic"), collider.name)
			GameEvents.emit_signal("info_discovered", collider.name)
			collider.set_deferred("monitoring", false)
	position += direction
