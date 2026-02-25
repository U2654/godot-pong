class_name Paddle
extends Area2D

@export var speed := 300.0
@export var is_left := true

func _process(delta):
	var direction := 0

	if is_left:
		if Input.is_action_pressed("left_up"):
			direction -= 1
		if Input.is_action_pressed("left_down"):
			direction += 1
	else:
		if Input.is_action_pressed("right_up"):
			direction -= 1
		if Input.is_action_pressed("right_down"):
			direction += 1

	position.y += direction * speed * delta
	clamp_to_screen()

func clamp_to_screen():
	var rect := get_viewport_rect()
	var half_height : float = $CollisionShape2D.shape.size.y / 2.0
	position.y = clamp(position.y, half_height, rect.size.y - half_height)
