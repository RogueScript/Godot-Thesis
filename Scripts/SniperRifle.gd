extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var bullet =  preload("res://EnemyBullet.tscn");
#onready var level = get_tree().root.get_node("Level1");
# Called when the node enters the scene tree for the first time.
var level;
var sniperPosition;
var canShoot = true;
var fireDelay = 1.7;
func _ready():
	SetLevelVariable();
	sniperPosition = get_parent();
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if get_parent().get_node("Player") != null:
	var playerPosition = level.get_node("Player");
	if playerPosition != null:
		look_at(playerPosition.position);
		if (sniperPosition.position.x - playerPosition.position.x ) < 450 && canShoot == true:
			canShoot = false;
			#print(sniperPosition.position.x - playerPosition.position.x);
			yield(get_tree().create_timer(fireDelay),"timeout");
			canShoot = true;
			var projectile = bullet.instance();
			level.add_child(projectile);
			projectile.position = $Position2D.global_position;
			projectile.rotation = rotation;
	# transforms the value of the sprite's rotation to an angle
	var angle =  fposmod(rotation_degrees,360.0);
	if angle <= 270 && angle >= 90:
		position.y = -3;
		position.x = -6;
		flip_v = true;
	else:
		position.y = 3;
		position.x = 6;
		flip_v = false;
	
func SetLevelVariable():
	level = get_parent().get_parent();
pass 
