extends TextureRect

# Declare member variables here. Examples:
signal enter
signal exit
var untaken;
# Called when the node enters the scene tree for the first time.
func _ready():
	untaken = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if untaken == false:
		visible = false
		$ChestB/CollisionShape2D.disabled = true


func _on_Soldier_open():
	$ChestB/Label.visible = false
	$ChestB/Popup.visible = true

func _on_Soldier_close():
	$ChestB/Label.visible = true
	$ChestB/Popup.visible = false

func _on_Soldier_take():
	#visible = false
	#$ChestB/CollisionShape2D.disabled = true
	untaken = false

func _on_Area2D_body_entered(body):
	emit_signal("enter")


func _on_Area2D_body_exited(body):
	emit_signal("exit")


func _on_Soldier_open2():
	$ChestB/Label.visible = false
	$ChestB/Popup.visible = true


func _on_Soldier_take2():
	untaken = false


func _on_Soldier_close2():
	$ChestB/Label.visible = true
	$ChestB/Popup.visible = false
