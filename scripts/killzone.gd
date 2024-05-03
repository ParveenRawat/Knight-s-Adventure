extends Area2D

@onready var timer = $Timer
@onready var hurt = $hurt

func _on_body_entered(body):
	hurt.play()
	body.velocity.y -= 100
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	body.rotation += 15 * body.velocity.x
	
func _on_timer_timeout():
	get_tree().reload_current_scene()
