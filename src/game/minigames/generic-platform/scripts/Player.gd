extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const MAX_FALLSPEED = 400
const MAXSPEED = 320
const JUMPFORCE = 600

var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	if motion.y > MAX_FALLSPEED:
		motion.y = MAX_FALLSPEED
	
	if Input.is_action_pressed("ui_left"):
		motion.x = -MAXSPEED
	elif Input.is_action_pressed("ui_right"):
		motion.x = MAXSPEED
	else:
		motion.x = 0
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = -JUMPFORCE

	motion = move_and_slide(motion, Vector2.UP)
