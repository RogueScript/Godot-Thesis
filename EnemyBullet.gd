extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2(0,0);
var speed = 150;
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	apply_impulse(Vector2(), Vector2(speed, 0).rotated(rotation));
	pass

func _on_EnemyBullet_body_entered(body):
	if body.name == "TileMap":
		print(" Enemy sniper hit the wall")
		queue_free();
	pass # Replace with function body. 


func _on_EnemyBullet_area_entered(area):
	if area.name == "PlayerHitBox":
		var bulletpos = position.x;
		$CollisionShape2D.disabled = true;
		speed = 0;
		#print("Enemy sniper hit the player ");
		queue_free();
	
