extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pistol = preload("res://pistol.tscn");

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Pickup_area_entered(area):
	if area.name == "PlayerHitBox":
		print("Interacting pickup with ", area.get_parent().name);
		var gun = pistol.instance();
		area.get_parent().add_child(gun);
		queue_free();
	pass # Replace with function body.
