extends KinematicBody2D

const gravity = 30;
const speed = -200;
var hp = 3;
const wall = Vector2 ( 0, -1);
var velocity = Vector2();
var direction = 1;
var hitDirection;
var enemy_corpse = preload("res://enemyCorpse.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.x = speed * direction;
	velocity.y += gravity;
	
	velocity = move_and_slide(velocity,wall);
	"""var slide_count = get_slide_count()
	if slide_count:
		var collision = get_slide_collision(slide_count - 1)
		var collider = collision.collider
		if collider.get("name") == "Player":
			collider.get_class("Player")
			print(collision.position.x);
			print("Collides with player");"""
			
		
	if is_on_wall():
		direction = direction *-1;
		$RayCast2D.position.x *= -1;
		ChangeDirection();
	if $RayCast2D.is_colliding() == false:
		direction = direction *-1;
		$RayCast2D.position.x *= -1;
		ChangeDirection(); 

func ChangeDirection():
	if direction == 1:
			get_node( "Sprite" ).set_flip_h( false )
	elif direction == -1:
			get_node( "Sprite" ).set_flip_h( true ) 
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
func _on_EnemyArea_area_entered(area):
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
	pass 
