extends KinematicBody2D

const GRAVITY = 10
const SPEED = 80
const FLOOR = Vector2(0, -1)

var velocity = Vector2()

var direction = 1

onready var stomp_area: Area2D = $StompArea2D
		
func _physics_process(delta):
	
	if TeleporterData.isLevel2:
		velocity.x = (SPEED * direction) * 2
		print(TeleporterData.isLevel2, "kiirus: ", velocity.x)
	else: 
		velocity.x = SPEED * direction
		print(TeleporterData.isLevel2, "kiirus: ", velocity.x)
	
	if direction == 1:
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true
		
	$AnimatedSprite.play('walk')
	
	velocity.y += GRAVITY
	velocity = move_and_slide(velocity, FLOOR)
	
	 
	if is_on_wall():
		direction = direction * -1
		$RayCast2D.position.x *= -1

	if $RayCast2D.is_colliding() == false:
		direction = direction * -1
		$RayCast2D.position.x *= -1


