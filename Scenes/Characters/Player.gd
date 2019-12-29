extends "res://Scenes/Characters/CharacterTemplate.gd"

func _physics_process(delta):
	apply_gravity()
	jump()
	walk()
	motion = move_and_slide(motion, UP)

func walk():
	if Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
		motion.x = clamp(motion.x + ACCELERATION, 0, MAX_SPEED)
	elif Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
		motion.x = clamp(motion.x - ACCELERATION, -MAX_SPEED, 0)
	else:
		motion.x = lerp(motion.x, 0, FRICTION)

func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y = JUMP_SPEED