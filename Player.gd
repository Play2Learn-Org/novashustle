extends KinematicBody2D

var tilesize = 64
var speed = 100

onready var ray = $RayCast2D

var inputs = {
	'ui_up' : Vector2.UP,
	'ui_down' : Vector2.DOWN,
	'ui_left' : Vector2.LEFT,
	'ui_right' : Vector2.RIGHT,
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _unhandled_input(event):
	for direction in inputs.keys():
		if event.is_action_pressed(direction):
			move(inputs[direction] * tilesize) # Not inputs(direction)?

func move(direction):
	print("move", direction)
	ray.cast_to = direction
	ray.force_raycast_update()
	print(position, direction)
	if !ray.is_colliding():
		position += direction