extends CharacterBody2D

@export var Bullet_scene:PackedScene
@export var Bullet_Spawn:Node2D

const SPEED = 30.0
const JUMP_VELOCITY = -400.0

const Turn_Rate = 180

func _physics_process(delta: float) -> void:

	var r = Input.get_axis("Turn_Left", "Turn_Right")
	
	var rot = deg_to_rad(r * Turn_Rate * delta)
	var f = Input.get_axis("Move_Back", "Move_Forward")
	
	var dir = transform.y * f * SPEED
	
	velocity = dir
	
	if Input.is_action_pressed("Fire"):
		var b = Bullet_scene.instanticate()
		b.position = Bullet_Spawn.position
		add_child(b)
	
	rotate(rot)
	move_and_slide()
