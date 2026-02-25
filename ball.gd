class_name Ball
extends Area2D

var speed := 300.0

signal scored(side : String)

var velocity := Vector2.ZERO
var start_position := Vector2.ZERO

func _ready():
	speed = Settings.ball_speed
	start_position = position
	reset_ball()

func reset_ball():
	position = start_position
	# Randomly pick -1 or 1 for the x-direction
	var dir_x := (-1 if randf() < 0.5 else 1)
	velocity = Vector2(dir_x, randf_range(-0.5, 0.5)).normalized() * speed

func stop_ball():
	velocity = Vector2.ZERO

func _physics_process(delta):
	# move ball
	position += velocity * delta

	# check upper and lower boundary collision
	var rect = get_viewport_rect()
	if position.y < 0 or position.y > rect.size.y:
		velocity.y *= -1

	# check left and right boundary collision after paddle
	if position.x < 0:        
		reset_ball()
		emit_signal("scored", "right")        
	elif position.x > rect.size.x:
		reset_ball()	
		emit_signal("scored", "left")        


func _on_area_entered(_area):
	velocity.x *= -1
	$HitSound.play()
	
