extends KinematicBody2D
var velocity = Vector2(0,0);
var gravity = 30;
const wall = Vector2 ( 0, -1);


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var direction = 0;


# Called when the node enters the scene tree for the first time.
func _ready():
	velocity.x = 700 * direction;
	velocity.y = -400;
	#print("Enemy corpse direction is " , direction);
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ChangeDirection();
	velocity.y += gravity;
	velocity = move_and_slide(velocity,wall);
	velocity.x = lerp(velocity.x, 0, 0.1);
	if is_on_floor():
		$Sprite.region_rect = Rect2(76, 43, 49, 21);
		_Level_Restart();
	pass
func GetDirection(dir):
	direction = dir;
	pass
	
	
func ChangeDirection():
	if direction == 1:
			get_node( "Sprite" ).set_flip_h( false )
	elif direction == -1:
			get_node( "Sprite" ).set_flip_h( true ) 

func _Level_Restart():
	yield(get_tree().create_timer(2.0), "timeout");
	get_tree().change_scene("res://Level1.tscn");
	# deleting the corpse, otherwise the game will continuosly attempt to reload the level.
	queue_free();
	print("Level restarted");
	pass
