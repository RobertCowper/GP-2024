extends Node2D

@export var move_distance = 10
@export var move_direction = 1  # 1 for right, -1 for left
@export var time_between_moves = 1.0
@export var ufo_scene:PackedScene

@export var radius:float = 200

var move_timer = 0

func _process(delta):
	move_timer += delta
	if move_timer >= time_between_moves:
		move_timer = 0
		move_grid()

func move_grid():
	# Check if any child is at screen edge
	var should_change_direction = false
	for child in get_children():
		if (child.global_position.x < 50 and move_direction < 0) or \
		   (child.global_position.x > 590 and move_direction > 0):
			should_change_direction = true
			break
	
	if should_change_direction:
		move_direction *= -1
		position.y += move_distance  # Move down
	else:
		position.x += move_direction * move_distance  # Move sideways
