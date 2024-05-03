extends Node2D

var SPEED = 60

var direction = 1

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var raycastright = $raycastright
@onready var raycastleft = $raycastleft

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if direction == 1 :
		animated_sprite_2d.flip_h = false
	if direction == -1 :
		animated_sprite_2d.flip_h = true
		
	if raycastright.is_colliding():
		direction = -1
	if raycastleft.is_colliding():
		direction = 1
	position.x += SPEED * delta  * direction
