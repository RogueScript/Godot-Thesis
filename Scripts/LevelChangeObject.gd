extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LevelChange_area_entered(area):
	if area.name == "PlayerHitBox":
		# gets the player object
		var player = area.get_parent();
		# removes the player from the hierarchy, preventing him being deleted with the scene
		get_tree().root.get_child(1).remove_child(player);
		SceneChanger.ChangeScene(player);
	pass # Replace with function body.
