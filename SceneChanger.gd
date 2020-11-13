extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var scene : String
var PlayerObject;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func ChangeScene(Player):
	get_tree().change_scene("res://Level2.tscn");
	PlayerObject = Player;
	print("The object is " , Player);
	pass
func GetPlayer():
	print("Sending the object which is ", PlayerObject)
	return PlayerObject;
