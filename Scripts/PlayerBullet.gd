extends RigidBody2D



# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2(0,0);
var speed = 50;
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	apply_impulse(Vector2(), Vector2(speed, 0).rotated(rotation));
	pass

func _on_PlayerBullet_area_entered(area):
	if area.name == "EnemyArea" || "SniperArea2D":
		queue_free();
	pass # Replace with function body.


func _on_PlayerBullet_body_entered(body):
	if body.name == "TileMap":
		queue_free();
	pass # Replace with function body.
