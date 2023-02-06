extends Area2D

var occupied = false



func _on_FloorTarget_body_entered(body):
	if body.is_in_group('tomove'):
		occupied = true



func _on_FloorTarget_body_exited(body):
	if body.is_in_group('tomove'):
		occupied = false
