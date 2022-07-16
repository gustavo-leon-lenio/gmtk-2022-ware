extends KinematicBody2D

const UP = Vector2(0,-1)
const FLAP = 200
const MAXFALLSPEED = 200
const GRAVITY = 10

var motion = Vector2()
var Wall = preload("res://src/game/minigames/flappy-duck/Wallnode.tscn")
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(_delta):
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	if Input.is_action_just_pressed("FLAP"):
		motion.y = -FLAP
	
	motion = move_and_slide(motion, UP)

func Wall_reset(body):
	var Wall_instance = Wall.instance()
	Wall_instance.apply_scale(Vector2(1.5,2))
	Wall_instance.position = Vector2(544, rand_range(-60,60))
	get_parent().call_deferred('add_child',Wall_instance)
	
	
func _on_Resetter_body_entered(body):
	if body.name == "Walls":
		body.queue_free()
		Wall_reset(body)


func _on_Detect_area_entered(area):
	if area.name == "PointArea":
		score = score +1


func _on_Detect_body_entered(body):
	# lose condition
	if body.name == "Walls":
		get_tree().reload_current_scene();
