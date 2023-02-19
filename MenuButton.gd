extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MenuButton_pressed():
	if self.name == "QuitBtn":
		get_tree().quit()
		return
	if self.name == "StartBtn":
		get_tree().reload_current_scene()
	else:
		assert(false, "An action should have happened when clicking the button")
