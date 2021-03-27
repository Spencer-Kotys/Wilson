extends KinematicBody2D

# Declare member variables here. Examples:
onready var RR = get_node("RayR")
onready var RL = get_node("RayL")
onready var RG = get_node("RayG")
onready var move_right = true
onready var alive = true
# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.flip_v = false
	$Sprite.flip_h = true
	$CollisionShape2D.disabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if alive == false:
		$Sprite.flip_v = true
		$CollisionShape2D.disabled = true
	else:
		if move_right:
			if RG.is_colliding():
				move_and_collide(Vector2(2,0))
				if RR.is_colliding() and RL.is_colliding():
					$Sprite.flip_h = false
				elif RR.is_colliding():
					move_right = false
					$Sprite.flip_h = false
			else:
				move_and_collide(Vector2(-2,0))
				move_right = false
				$Sprite.flip_h = false
		else:
			if RG.is_colliding():
				move_and_collide(Vector2(-2,0))
				if RR.is_colliding() and RL.is_colliding():
					$Sprite.flip_h = false
				elif RL.is_colliding():
					move_right = true
					$Sprite.flip_h = true
			else:
				move_and_collide(Vector2(2,0))
				move_right = true
				$Sprite.flip_h = true
	move_and_slide(Vector2(0,400))

func _on_Area2D_body_entered(body):
	alive = false
