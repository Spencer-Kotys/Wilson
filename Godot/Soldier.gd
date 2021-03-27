extends KinematicBody2D

# Declare member variables here. Examples:
signal health_changed
signal inventory
signal open
signal close 
signal take
export var Gravity = 300
const WalkSpeed = 200
const Jump = -400
var velocity = Vector2()
var react = Vector2()
var freeze = Vector2()
var max_health = 100
var health = max_health
var in_chest = false
onready var RG = get_node("RayGround")
onready var RR = get_node("RayR")
onready var RL = get_node("RayL")
signal dead
signal win
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.y += delta * Gravity
	if Input.is_action_pressed("ui_right"):
		velocity.x = WalkSpeed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -WalkSpeed
	else:
		velocity.x = 0
		$Sprite.stop()
	if velocity.x != 0:
		$Sprite.play("Walk")
		$Sprite.flip_h = velocity.x < 0
	if Input.is_action_pressed("ui_up") and RG.is_colliding():
		velocity.y = Jump
	move_and_slide(velocity)
	if RR.is_colliding():
		var x = RR.get_collider()
		if x.get_class() == "KinematicBody2D":
			health -= 10
			react.x = -1000
			move_and_slide(react)
			emit_signal("health_changed", health)
		elif x.get_class() == "StaticBody2D":
			if Input.is_key_pressed(85):
				velocity.y = Jump
	if RL.is_colliding():
		var x = RL.get_collider()
		if x.get_class() == "KinematicBody2D":
			health -= 10
			react.x = 1000
			move_and_slide(react)
			emit_signal("health_changed", health)
		elif x.get_class() == "StaticBody2D":
			if Input.is_key_pressed(85):
				velocity.y = Jump
	if health <= 0:
		kill()
	#if Input.is_key_pressed(73):
		#emit_signal("inventory")
	if in_chest == true:
		if Input.is_key_pressed(69):
			emit_signal("open")
		if Input.is_key_pressed(89):
			emit_signal("close")
			emit_signal("take")
			in_chest = false
			emit_signal("win")
		if Input.is_key_pressed(78):
			emit_signal("close")
func kill():
	$Sprite.flip_v = true
	$CollisionShape2D.disabled = true
	emit_signal("dead")

func _on_Fall_body_entered(body):
	$Sprite.flip_v = true
	emit_signal("dead")

func _on_Chest_enter():
	in_chest = true

func _on_Chest_exit():
	in_chest = false
