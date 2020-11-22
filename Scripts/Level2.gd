extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Level loaded");
	player = SceneChanger.GetPlayer();
	add_child(player);
	#player.instance();
	player.position.x = 100;
	player.position.y = 450;
	print(player);
	var pistol = player.get_child(4);
	pistol.SetLevelVariable();
	print(player , pistol);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
