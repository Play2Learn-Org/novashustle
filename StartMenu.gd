extends Control

var is_paused = false setget setpause

func setpause(boolval):
	is_paused = boolval

func pauseunpause():
	setpause(!is_paused)

# TODO This needs to move to the Game.gd script
func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		pauseunpause()
		print("is paused:", is_paused)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_StartBtn_pressed():
	get_tree().change_scene("res://GameView.tscn")


func _on_QuitBtn_pressed():
	get_tree().quit()
