extends KinematicBody2D

const ACCELERATION = 100
const GRAVITY = 100
const WALK_SPEED = 400
const SPRINT_SPEED = 600
const JUMP_SPEED = -1600
const FRICTION = 0.2
const UP = Vector2(0,-1)

var motion = Vector2()

func apply_gravity():
	if not is_on_floor():
		motion.y += GRAVITY
	else:
		motion.y = 0