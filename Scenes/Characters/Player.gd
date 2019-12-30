extends "res://Scenes/Characters/CharacterTemplate.gd"

func _physics_process(delta):
	apply_gravity()
	jump()
	walk()
	motion = move_and_slide(motion, UP)

func walk():
	if Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
		if Input.is_action_pressed("sprint"):
			motion.x = clamp(motion.x + ACCELERATION, 0, SPRINT_SPEED)
			$AnimatedSprite.play("run")
		else:
			$AnimatedSprite.play("walk")
			motion.x = clamp(motion.x + ACCELERATION, 0, WALK_SPEED)
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
		if Input.is_action_pressed("sprint"):
			motion.x = clamp(motion.x - ACCELERATION, -SPRINT_SPEED, 0)
			$AnimatedSprite.play("run")
		else:
			motion.x = clamp(motion.x - ACCELERATION, -WALK_SPEED, 0)
			$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = true
	elif motion.y == 0:
		motion.x = lerp(motion.x, 0, FRICTION)
		$AnimatedSprite.play("idle")

func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y = JUMP_SPEED
		$AnimatedSprite.play("jump")