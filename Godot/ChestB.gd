extends StaticBody2D

# Declare member variables here. Examples:


# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.visible = false
	$Popup.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):


func _on_Area2D_body_entered(body):
	$Label.visible = true


func _on_Area2D_body_exited(body):
	$Label.visible = false
