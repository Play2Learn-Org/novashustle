extends Node2D

class_name CrateInfoNode

var topic = "none"

func _ready():
	self.topic = "Crate Info"
	GameEvents.connect("info_discovered", self, "_on_Info_discovered")

func _on_Info_discovered(topic_in):
	print("handle event info_discovered with topic: ", topic_in)
	if topic_in == "Crate Info":
		$CratePlayer.play("CrateTextAppear")

