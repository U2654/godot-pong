extends Control

func _on_StartButton_pressed():
	get_tree().change_scene_to_file("res://game.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()

func _on_SpeedSlider_value_changed(value):
	Settings.ball_speed = value*10
