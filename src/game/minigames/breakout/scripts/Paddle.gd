extends KinematicBody2D

const MOVE_SPEED = 350

var motion := Vector2.ZERO

func _ready():
	OS.center_window()

func _physics_process(delta):
	motion = Vector2.ZERO
	if Input.is_action_pressed("ui_left"):
		motion.x = -MOVE_SPEED
	if Input.is_action_pressed("ui_right"):
		motion.x = MOVE_SPEED
	motion = move_and_slide(motion, Vector2.UP)
