extends Area2D



func _on_Prize_body_entered(body):
	if body.is_in_group("player"):
#		TODO set score
		queue_free()
