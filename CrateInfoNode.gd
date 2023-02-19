extends Node2D

class_name CrateInfoNode

func _ready():
	GameEvents.connect("info_discovered", self, "_on_Info_discovered")

func _on_Info_discovered(topic_in):
	if topic_in == "CrateInfoSignaler":
		$CratePlayer.play("CrateTextAppear")

