extends KinematicBody2D
var velocity = Vector2(0,0);
var gravity = 30;
const wall = Vector2 ( 0, -1);
var direction = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	velocity.x = 700 * direction;
	velocity.y = -400;
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ChangeDirection();
	velocity.y += gravity;
	velocity = move_and_slide(velocity,wall);
	velocity.x = lerp(velocity.x, 0, 0.1);
	if is_on_floor():
		$Sprite.region_rect = Rect2(76, 44 , 48 , 20);
		
		
	
	pass
func GetDirection(dir):
	direction = dir;
	pass
	
	
func ChangeDirection():
	if direction == 1:
			get_node( "Sprite" ).set_flip_h( false )
	elif direction == -1:
			get_node( "Sprite" ).set_flip_h( true ) 
