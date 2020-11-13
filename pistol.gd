extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var bullet =  preload("res://PlayerBullet.tscn");
#onready var level = get_tree().root.get_node("Level1");
# Called when the node enters the scene tree for the first time.
var level;
func _ready():
	SetLevelVariable();
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if get_parent().get_node("Player") != null:
	var mousePosition = get_global_mouse_position();
	look_at(mousePosition);
	if Input.is_action_just_pressed("Shoot"):
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
	
# set the level variable for projectiles to spawn
func SetLevelVariable():
	level = get_parent().get_parent();
pass 
