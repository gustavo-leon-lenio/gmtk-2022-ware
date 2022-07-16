extends RigidBody2D

const PLAYFIELD_HEIGHT = 650

func _ready():
	mode = RigidBody2D.MODE_CHARACTER
	bounce = 1
	friction = 0
	gravity_scale = 0
	linear_damp = 0.0
	angular_damp = 0.0
	linear_velocity = Vector2(250, -250)

func _physics_process(delta):
#	Game over condition
	if(position.y > PLAYFIELD_HEIGHT):
		queue_free()
		
