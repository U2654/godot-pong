class_name Game
extends Node2D

const SCORE_LIMIT := 10

@onready var ball = $Ball
@onready var left_player = $LeftPaddle
@onready var right_player = $RightPaddle
@onready var scoreboard = $Scoreboard

var running := false

func _ready():
	# Connect the Ball's score signal
	ball.scored.connect(on_ball_scored)
	start()

func start():
	running = true
	scoreboard.reset_scores()
	ball.reset_ball()

func end_game():
	running = false
	scoreboard.show_winner()
	ball.stop_ball()

func on_ball_scored(side):    
	# Update the scoreboard    
	scoreboard.score_point(side)    
	# Check if anyone has won    
	if scoreboard.left_score >= SCORE_LIMIT \
	or scoreboard.right_score >= SCORE_LIMIT:
		end_game()
