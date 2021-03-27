extends Area2D

onready var RR = get_node("RR")
onready var RL = get_node("RL")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.visible = false
	if RR.is_colliding():
		$Sprite.flip_h = false
		$Label.visible = true
	if RL.is_colliding():
		$Sprite.flip_h = true
		$Label.visible = true
