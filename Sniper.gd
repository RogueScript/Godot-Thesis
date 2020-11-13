extends KinematicBody2D

const gravity = 30;
var hp = 3;
const wall = Vector2 ( 0, -1);
var velocity = Vector2();
var direction = 1;
var hitDirection;
var enemy_corpse = preload("res://sniperCorpse.tscn");
var flip = false;
var rifleFlip;
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#we determine the flip of the sniper's sprite by which way the rifle is looking
	rifleFlip = get_child(3);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if rifleFlip.flip_v == true:
		$Sprite.flip_h = false;
	else:
		$Sprite.flip_h = true;
	#velocity.y += gravity;
	#velocity = move_and_slide(velocity,wall);
	pass
func EnemyHit():
	if hp == 0:
		HitBlink();
		print("Enemy is dead maboi");
		EnemyDeath();
	else:
		hp -= 1;
		HitBlink();
	pass
# function to make the enemy blink on hit, providing a visual cue that the thenemy was shot.
func HitBlink():
	$Sprite.modulate = Color(0, 0, 1);
	yield(get_tree().create_timer(0.05), "timeout");
	$Sprite.modulate = Color(1, 1, 1);
	pass
# function that spawns the enemy's corpse and deletes the enemy.
func EnemyDeath():
	var corpse = enemy_corpse.instance();
	corpse.GetDirection(hitDirection);
	var level = get_parent();
	level.add_child(corpse);
	corpse.position = global_position;
	queue_free();
	pass


func _on_SniperArea2D_area_entered(area):
	if area.name == "PlayerBullet":
		var rigidbody = area.get_parent();
		# get the direction of the bullet
		var velocityDirection = sign(rigidbody.linear_velocity.x);
		hitDirection = velocityDirection;
		"""var collisionPosition = area.get_parent().get_position();
		if collisionPosition> global_position:
			#print("Hit me on the right side")
			hitDirection = -1;
		else:
			#print("Hit me on the left side ");
			hitDirection = 1; """
		EnemyHit();
	pass # Replace with function body.
