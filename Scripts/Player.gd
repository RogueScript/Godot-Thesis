extends KinematicBody2D
var velocity = Vector2(0,0);
var jumpHeigh = -600;
var gravity = 30;
onready var spriteScale = $Sprite;
var hitDirection;
const speed = 400;
var player_corpse = preload("res://playerCorpse.tscn")
var pistol = preload("res://pistol.tscn");
const enemy = preload("res://DefaultEnemy.tscn");

func _ready():
	#var gun = pistol.instance();
	#add_child(gun);
	pass

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x = speed;
		$Sprite.flip_h = false;
		
		#spriteScale.flip_h = false;
	elif Input.is_action_pressed("left"):
		velocity.x = -speed;
		spriteScale.flip_h = true;
		#$Sprite.flip_h = true;
	else:
		velocity.x = 0;
	
	velocity.y = velocity.y + gravity;
	# just pressed prevents from flying when pressing spacebar
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jumpHeigh;
		
	# vector2.up is used to check the direction of the floor, prevents from jumping in air
	velocity = move_and_slide(velocity, Vector2.UP);
	# prevents non-stop movement, drops the movement speed from the currently set value to 0 with the weight specified
	velocity.x = lerp(velocity.x, 0, 0.1);
func playerDeath():
	var corpse = player_corpse.instance();
	corpse.GetDirection(hitDirection);
	get_tree().root.add_child(corpse);
	corpse.position = global_position;
	var cam = get_node("Camera2D");
	remove_child(cam);
	#print(camera.name);
	#print("Child count is", camera)
	corpse.add_child(cam);
	# delete player
	queue_free();
	return print("player dies F");
	
	
func _on_PlayerHitBox_area_entered(area):
	if area.name == "EnemyArea":
		var collisionPosition = area.get_parent().get_position();
		#print("The position of bullet area2D is ", collisionPosition.x, " The player position is ", position.x);
		#print("The velocity x is ", velocity);

		if collisionPosition.x> position.x:
			print("Hit me on the right side")
			hitDirection = -1;
		else:
			print("Hit me on the left side ");
			hitDirection = 1;
		playerDeath();
	elif area.name == "EnemyBullet":
		var rigidBody = area.get_parent();
		var velocityDirection = sign(rigidBody.linear_velocity.x);
		hitDirection = velocityDirection;
		playerDeath();
	pass 

