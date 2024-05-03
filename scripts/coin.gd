extends Area2D

var collected = false
@onready var game_manager = %GameManager
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var timer = $Timer
@onready var collision_shape_2d = $CollisionShape2D
@onready var animation_player = $AnimationPlayer

func _process(delta):
	if collected :
		position.y -= 40 * delta


func _on_body_entered(body):
	get_node("CollisionShape2D").queue_free()
	collected = true
	animated_sprite_2d.play("quick_spin")
	game_manager.add_coin()
	animation_player.play("coin")
	timer.start()

func _on_timer_timeout():
	queue_free()
