extends KinematicBody2D

var tilesize=64

onready var ray = $RayCast2D

var inputs = {
	"ui_up" : Vector2.UP,
	"ui_down" : Vector2.DOWN,
	"ui_left" : Vector2.LEFT,
	"ui_right" : Vector2.RIGHT,
}

func move(direction):
	ray.cast_to = direction
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += direction
		return true
	else:
		return false
