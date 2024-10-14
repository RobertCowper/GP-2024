extends CharacterBody2D

@export var bullet_scene:PackedScene
@export var bullet_spawn_point:Node2D

const SPEED = 500.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	
	if Input.is_key_pressed(KEY_W):
		position -= transform.y * SPEED * delta
	if Input.is_key_pressed(KEY_S):
		position += transform.y * SPEED * delta
		
	if Input.is_key_pressed(KEY_A):
		position += transform.x * SPEED * delta

	
	if Input.is_action_pressed("fire"):
		var b = bullet_scene.instantiate()
		b.global_position = bullet_spawn_point.global_position
		get_parent().add_child(b)
	
	move_and_slide()
