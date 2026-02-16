extends Node2D

@export var size = Vector2(20, 100)
@export var color = Color.WHITE

func _draw():    
	draw_rect(Rect2(-size/2, size), color)
	
