extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var jump = $jump

func _process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jump.play()
		velocity.y = JUMP_VELOCITY


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	
	if is_on_floor():
		if direction:
			velocity.x = direction * SPEED
			animated_sprite_2d.play("run")
		else:
			animated_sprite_2d.play("idle")
			velocity.x = move_toward(velocity.x, 0, SPEED)
	else:
		animated_sprite_2d.play("roll")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction == 1 :
		animated_sprite_2d.flip_h = false
	elif direction == -1 :
		animated_sprite_2d.flip_h = true

	move_and_slide()
