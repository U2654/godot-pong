class_name ScoreBoard
extends CanvasLayer

var left_score := 0
var right_score := 0

@onready var score_label = $ScoreLabel
@onready var winner_label = $WinnerLabel

func reset_scores():
	left_score = 0
	right_score = 0
	update_display()
	winner_label.visible = false

func score_point(side: String):
	if side == "left":
		left_score += 1
	elif side == "right":
		right_score += 1
	update_display()

func update_display():
	score_label.text = "%s : %s" % [left_score, right_score]

func show_winner():
	if left_score > right_score:
		winner_label.text = "Left Player Wins!"
	else:
		winner_label.text = "Right Player Wins!"
	winner_label.visible = true
