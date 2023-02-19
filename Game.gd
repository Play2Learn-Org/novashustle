extends Node2D

var game_done = false

func _ready():
	$Menus/AnimationPlayer.play("Headline Appears")

func _process(_delta):
	if !game_done:
		if $"TutorialTexts/First Task".percent_visible:
			GameEvents.emit_signal("intro_done")
		var spots = $TutorialMap/TargetSpots.get_child_count()
		for i in $TutorialMap/TargetSpots.get_children():
			if i.occupied:
				spots -= 1
	
		if spots == 0:
			$AcceptDialog.popup()
			game_done = true
