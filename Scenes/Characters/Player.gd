extends "res://Scenes/Characters/CharacterTemplate.gd"

func _physics_process(delta):
	walk()
	jump()
	motion = move_and_slide(motion)

func walk():
	if Input.is_action_pressed("move_rigth"):
		motion.x = clamp(motion.x + ACCELERATION, 0, MAX_SPEED)
	elif Input.is_action_pressed("move_left"):
		motion.x = clamp(motion.x-ACCELERATION, -MAX_SPEED, 0)
	else:
		motion.x = lerp(motion.x, 0, FRICTION)

func jump():
	if Input.is_action_pressed("jump"):
		motion.y -= JUMP_SPEED
	else:
		motion.y = 0